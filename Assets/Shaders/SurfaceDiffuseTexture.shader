Shader "Custom/SurfaceDiffuseTexture"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1,1,1,1) //(r,g,b,a)
        _MainTex("Main Texture", 2D) = "white" {}
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
           half4 _Albedo;
           sampler2D _MainTex;

           struct Input
           {
               float2 uv_MainTex;
           };

           void surf(Input IN, inout SurfaceOutput o)
           {
               half4 texColor = tex2D(_MainTex, IN.uv_MainTex);
               o.Albedo = _Albedo * texColor.rgb;
           }

        ENDCG
    }
}
