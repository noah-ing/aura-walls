#include <metal_stdlib>
using namespace metal;

// MARK: - Hash / Noise Primitives

static float hash21(float2 p) {
    return fract(sin(dot(p, float2(12.9898, 78.233))) * 43758.5453);
}

static float2 hash22(float2 p) {
    float2 k = float2(dot(p, float2(127.1, 311.7)),
                       dot(p, float2(269.5, 183.3)));
    return fract(sin(k) * 43758.5453);
}

static float2 randomGradient(float2 p) {
    float angle = hash21(p) * 6.28318530718;
    return float2(cos(angle), sin(angle));
}

static float gradientNoise(float2 st) {
    float2 i = floor(st);
    float2 f = fract(st);
    float2 u = f * f * (3.0 - 2.0 * f); // smoothstep

    float n00 = dot(randomGradient(i), f);
    float n10 = dot(randomGradient(i + float2(1, 0)), f - float2(1, 0));
    float n01 = dot(randomGradient(i + float2(0, 1)), f - float2(0, 1));
    float n11 = dot(randomGradient(i + float2(1, 1)), f - float2(1, 1));

    return mix(mix(n00, n10, u.x), mix(n01, n11, u.x), u.y) * 0.5 + 0.5;
}

static float fbm(float2 st, int octaves) {
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;
    for (int i = 0; i < octaves; i++) {
        value += amplitude * gradientNoise(st * frequency);
        frequency *= 2.0;
        amplitude *= 0.5;
    }
    return value;
}

// MARK: - Film Grain

[[ stitchable ]] half4 filmGrain(
    float2 position,
    half4 color,
    float seed,
    float intensity
) {
    float noise = fract(sin(dot(position + seed, float2(12.9898, 78.233))) * 43758.5453);
    half grain = half((noise - 0.5) * intensity);
    return half4(clamp(color.rgb + grain, half3(0), half3(1)), color.a);
}

// MARK: - Perlin Noise Overlay

[[ stitchable ]] half4 perlinNoise(
    float2 position,
    half4 color,
    float seed,
    float scale,
    float opacity,
    float2 size
) {
    float2 uv = position / size;
    float2 st = uv * scale + seed;
    float n = fbm(st, 5);

    // Blend noise as luminance variation
    half3 noiseColor = half3(half(n));
    half3 result = mix(color.rgb, noiseColor, half(opacity));
    return half4(result, color.a);
}

// MARK: - Voronoi Cells

[[ stitchable ]] half4 voronoiCells(
    float2 position,
    half4 color,
    float seed,
    float scale,
    float opacity,
    float2 size
) {
    float2 uv = position / size;
    float2 st = uv * scale;

    float2 i_st = floor(st);
    float2 f_st = fract(st);

    float minDist = 1.0;
    float secondDist = 1.0;

    for (int y = -1; y <= 1; y++) {
        for (int x = -1; x <= 1; x++) {
            float2 neighbor = float2(float(x), float(y));
            float2 point = hash22(i_st + neighbor + seed);
            float2 diff = neighbor + point - f_st;
            float dist = length(diff);

            if (dist < minDist) {
                secondDist = minDist;
                minDist = dist;
            } else if (dist < secondDist) {
                secondDist = dist;
            }
        }
    }

    // Edge-detected Voronoi (F2 - F1)
    float edge = secondDist - minDist;
    float cellValue = smoothstep(0.0, 0.15, edge);

    half3 cellColor = color.rgb * half(cellValue);
    half3 result = mix(color.rgb, cellColor, half(opacity));
    return half4(result, color.a);
}

// MARK: - Vignette

[[ stitchable ]] half4 vignette(
    float2 position,
    half4 color,
    float intensity,
    float2 size
) {
    float2 uv = position / size;
    float2 center = uv - 0.5;
    float dist = length(center) * 1.414; // normalize to 0-1 at corners
    float vig = 1.0 - smoothstep(0.4, 1.2, dist * intensity);

    return half4(color.rgb * half(vig), color.a);
}
