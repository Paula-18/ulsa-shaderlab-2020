Shader "Custom/SDCustomLambert"
{
     Properties
    {
        _Albedo("Albedo Color", Color) = (1,1,1,1) //(r,g,b,a)
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM

           #pragma surface surf Lambert

            //Light model difusse (Lambert)
           
           half4 LightingCustomLambert(SurfaceOutput s, half3 lightDir, half atten)
           {
               half NdotL = dot(s.Normal, lightDir);
               half4 c;
               c.rgb = s.Albedo * _LightColor0.rgb * NdotL *atten;
               c.a = s.Alpha;
               return c;
           }

           half4 _Albedo;

           struct Input
           {
               float2 uv_MainTex;
           };

           void surf(Input IN, inout SurfaceOutput o)
           {
               o.Albedo = _Albedo;
           }

        ENDCG
    }
}