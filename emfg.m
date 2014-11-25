function y=emfg(u)
vi=12;
vh=vi/2;
if(u>0)&&(u<=60)
    y=[vi;vh;0];
elseif(u>60)&&(u<=120)
    y=[vh;vi;0];
elseif(u>120)&&(u<=180)
    y=[0;vi;vh];
elseif (u>-180)&&(u<=-120)
    y=[0;vh;vi];
elseif(u>-120)&&(u<=-60)
    y=[vh;0;vi];
elseif(u>-60)&&(u<=0)
    y=[vi;0;vh];
end