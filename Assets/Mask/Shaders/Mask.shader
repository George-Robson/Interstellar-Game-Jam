Shader "Mask"
{
    Properties{
        _Scale ("Scale", float) = 1
        _Speed ("Speed", float) = 1
        _Frequency ("Frequency", float) = 1
    }
    
    SubShader
    {
        Tags { "Queue" = "Transparent+1" }
        
        Pass {
            Blend Zero One
        }
        
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        float _Scale, _Speed, _Frequency;

        struct Input {
            float2 uv_MainTex;
        };
        
        void vert(inout appdata_full v) {
            half offsetVert = sin(v.vertex.x);

            half value = _Scale * sin(_Time.w * _Speed + offsetVert * _Frequency);
            
            v.vertex.y += value;
        }

        void surf (Input IN,inout SurfaceOutput o) {
            
        }
        
        ENDCG
    }
}