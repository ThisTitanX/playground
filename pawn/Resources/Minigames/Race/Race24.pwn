// Copyright 2006-2015 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the GPLv2 license, a copy of which can
// be found in the LICENSE file.

// Las Venturas Playground v2.94.0 - Race 24: Cop Bike Chase
// This race was created by Maikovich


#define RACE24 24

race_start(RACE24)
{

    race_set_id( RACE24 );
    race_set_name( "Bike Chase" );
    race_set_maxtime( 500 );
    race_set_vehicle( 522 );
    race_set_weather( 4 );
    race_set_maydrop( 1 );
    race_set_airrace( 0 );
    race_set_time( 6, 0 );
    race_set_laps( 1 );
    race_set_interior( 0 ); 

    race_disable_vehicle_damage ();

    race_set_type( RACE_TYPE_STUNT );

    race_add_spawn( 1681.309204, -1729.340454, 12.957458, 93.387557, -1, -1 );
    race_add_spawn( 1680.930664, -1732.130981, 12.955836, 92.376998, -1, -1 );
    race_add_spawn( 1681.196411, -1733.812255, 12.956542, 92.284629, -1, -1 );
    race_add_spawn( 1680.717285, -1736.147705, 12.955749, 87.983848, -1, -1 );

    race_add_checkpoint( 1583.318725, -1732.460937, 12.950281, 10.000000 );
    race_add_checkpoint( 1530.793090, -1662.718383, 12.950134, 10.000000 );
    race_add_checkpoint( 1519.887817, -1580.635009, 23.115306, 10.000000 );
    race_add_checkpoint( 1442.793579, -1581.553100, 23.113058, 10.000000 );
    race_add_checkpoint( 1456.742187, -1512.078491, 23.090789, 10.000000 );
    race_add_checkpoint( 1631.683105, -1533.332641, 21.296028, 10.000000 );
    race_add_checkpoint( 1696.287231, -1570.143310, 23.947938, 10.000000 );
    race_add_checkpoint( 1732.461914, -1553.177734, 32.929450, 10.000000 );
    race_add_checkpoint( 1765.813110, -1563.964477, 38.551429, 10.000000 );
    race_add_checkpoint( 1780.141723, -1644.416259, 38.676521, 10.000000 );
    race_add_checkpoint( 1798.265014, -1681.693969, 43.831146, 10.000000 );
    race_add_checkpoint( 1785.438842, -1759.834838, 52.034404, 10.000000 );
    race_add_checkpoint( 1748.787841, -1872.479858, 29.634880, 10.000000 );
    race_add_checkpoint( 1743.904296, -2027.221069, 19.932725, 10.000000 );
    race_add_checkpoint( 1679.138916, -1953.958618, 21.558967, 10.000000 );
    race_add_checkpoint( 1672.361083, -1852.763183, 27.685823, 10.000000 );
    race_add_checkpoint( 1670.427246, -1810.270141, 35.892948, 10.000000 );
    race_add_checkpoint( 1648.976684, -1705.197631, 20.054340, 10.000000 );
    race_add_checkpoint( 1655.783691, -1646.031372, 27.974361, 10.000000 );

    race_add_object(1634,1528.47399902,-1609.49450684,13.68013000,0.00000000,0.00000000,8.00000000); //object(landjump2) (1)
    race_add_object(1634,1530.71740723,-1609.19104004,13.68013000,0.00000000,0.00000000,6.00000000); //object(landjump2) (2)
    race_add_object(1655,1553.10119629,-1510.94787598,22.24820518,345.00000000,0.00000000,268.00000000); //object(waterjumpx2) (1)
    race_add_object(1655,1673.87133789,-1553.85327148,23.08512497,345.00000000,359.00000000,234.00000000); //object(waterjumpx2) (2)
    race_add_object(1655,1703.34558105,-1574.99072266,24.08512497,0.00000000,358.99475098,249.99780273); //object(waterjumpx2) (4)
    race_add_object(1634,1733.14013672,-1568.14025879,27.91887474,0.00000000,0.00000000,354.00000000); //object(landjump2) (3)
    race_add_object(1634,1743.45593262,-1551.88513184,33.42344284,0.00000000,0.00000000,251.99998474); //object(landjump2) (4)
    race_add_object(1634,1742.41796875,-1554.70019531,33.42344284,0.00000000,0.00000000,247.99890137); //object(landjump2) (5)
    race_add_object(1634,1766.15551758,-1592.29858398,39.27272415,0.00000000,0.00000000,188.00000000); //object(landjump2) (6)
    race_add_object(1634,1768.64440918,-1591.95373535,39.27272415,0.00000000,0.00000000,193.99804688); //object(landjump2) (7)
    race_add_object(1634,1769.48645020,-1595.86059570,41.52844238,10.00000000,0.00000000,192.00000000); //object(landjump2) (8)
    race_add_object(1634,1766.71191406,-1596.19653320,41.52844238,9.99755859,0.00000000,187.99707031); //object(landjump2) (9)
    race_add_object(984,1727.96716309,-1584.36718750,27.25823593,0.00000000,0.00000000,90.00000000); //object(fenceshit2) (2)
    race_add_object(984,1736.99975586,-1584.47167969,27.25823593,0.00000000,0.00000000,90.00000000); //object(fenceshit2) (3)
    race_add_object(1634,1802.43188477,-1675.07165527,39.40669250,0.00000000,0.00000000,194.00000000); //object(landjump2) (10)
    race_add_object(1634,1799.25085449,-1675.78723145,39.40669250,0.00000000,0.00000000,191.99560547); //object(landjump2) (11)
    race_add_object(1634,1796.03332520,-1676.25524902,39.40669250,0.00000000,0.00000000,185.99157715); //object(landjump2) (12)
    race_add_object(1633,1803.53234863,-1680.97583008,42.88996124,10.00000000,10.00000000,190.00000000); //object(landjump) (1)
    race_add_object(1633,1800.74243164,-1681.53149414,42.72996140,9.99755859,0.00000000,183.99755859); //object(landjump) (2)
    race_add_object(1633,1796.67358398,-1681.73730469,42.73995972,12.00000000,0.00000000,181.99353027); //object(landjump) (3)
    race_add_object(1633,1803.71582031,-1687.17834473,45.37878418,5.00000000,10.00000000,180.00000000); //object(landjump) (4)
    race_add_object(1633,1800.51391602,-1688.65954590,45.37878418,0.00000000,0.00000000,173.99450684); //object(landjump) (5)
    race_add_object(1633,1796.54858398,-1688.07019043,45.27878571,3.00000000,3.00000000,169.99047852); //object(landjump) (6)
    race_add_object(1633,1802.77124023,-1694.23364258,47.45805740,0.00000000,9.00000000,172.00000000); //object(landjump) (7)
    race_add_object(1633,1799.13732910,-1694.17443848,47.45805740,5.00000000,0.00000000,167.99645996); //object(landjump) (8)
    race_add_object(1633,1795.75646973,-1693.50451660,47.40805817,5.00000000,0.00000000,167.99145508); //object(landjump) (9)
    race_add_object(1633,1776.11230469,-1630.92541504,36.80185699,0.00000000,0.00000000,216.00000000); //object(landjump) (11)
    race_add_object(1633,1772.85449219,-1633.24511719,36.80185699,0.00000000,0.00000000,215.99668884); //object(landjump) (12)
    race_add_object(1633,1769.59667969,-1635.56542969,36.80185699,0.00000000,0.00000000,215.99668884); //object(landjump) (13)
    race_add_object(1633,1768.17138672,-1636.58056641,36.80185699,0.00000000,0.00000000,215.99670410); //object(landjump) (14)
    race_add_object(1655,1799.60046387,-1700.43261719,49.44765472,0.00000000,0.00000000,172.00000000); //object(waterjumpx2) (5)
    race_add_object(1655,1796.61279297,-1700.15869141,49.48765564,0.00000000,0.00000000,165.99645996); //object(waterjumpx2) (6)
    race_add_object(1633,1801.35485840,-1694.54956055,47.45805740,4.99877930,0.00000000,167.99194336); //object(landjump) (15)
    race_add_object(1655,1799.14489746,-1704.69665527,51.56968689,8.00000000,0.00000000,172.00000000); //object(waterjumpx2) (8)
    race_add_object(1655,1795.68725586,-1704.15454102,51.56968689,7.99804688,0.00000000,167.99645996); //object(waterjumpx2) (9)
    race_add_object(1655,1798.58728027,-1709.13989258,54.03842163,10.00000000,0.00000000,172.00000000); //object(waterjumpx2) (10)
    race_add_object(1655,1794.67871094,-1708.28222656,54.03842163,9.99755859,0.00000000,167.99645996); //object(waterjumpx2) (11)
    race_add_object(1655,1797.26428223,-1712.99572754,56.49113464,15.00000000,0.00000000,168.00000000); //object(waterjumpx2) (12)
    race_add_object(1655,1794.12768555,-1712.43872070,56.49113464,10.00000000,0.00000000,163.99694824); //object(waterjumpx2) (13)
    race_add_object(1655,1772.25842285,-1806.05322266,52.76886368,0.00000000,0.00000000,164.00000000); //object(waterjumpx2) (14)
    race_add_object(1655,1765.35717773,-1804.14599609,52.76886368,0.00000000,0.00000000,165.99841309); //object(waterjumpx2) (15)
    race_add_object(1633,1743.08288574,-1942.83410645,29.05796242,340.00000000,0.00000000,0.00000000); //object(landjump) (20)
    race_add_object(1633,1742.67736816,-1959.07604980,29.05796242,344.99816895,0.00000000,0.00000000); //object(landjump) (21)
    race_add_object(1633,1742.77270508,-1974.33691406,28.05796242,350.00000000,0.00000000,0.00000000); //object(landjump) (23)
    race_add_object(1633,1743.05249023,-1989.82714844,26.05796242,345.00000000,0.00000000,0.00000000); //object(landjump) (24)
    race_add_object(1655,1700.66845703,-2053.27758789,20.86807442,0.00000000,0.00000000,80.00000000); //object(waterjumpx2) (16)
    race_add_object(1655,1702.11535645,-2046.15625000,20.86807442,0.00000000,0.00000000,75.99694824); //object(waterjumpx2) (17)
    race_add_object(1632,1675.76464844,-1884.11584473,22.25426292,0.00000000,0.00000000,6.00000000); //object(waterjump1) (1)
    race_add_object(1632,1678.99926758,-1883.80895996,22.25426292,0.00000000,0.00000000,9.99853516); //object(waterjump1) (2)
    race_add_object(1632,1668.55236816,-1837.73779297,28.44073677,0.00000000,0.00000000,0.00000000); //object(waterjump1) (3)
    race_add_object(1632,1672.23681641,-1837.77307129,28.44073677,0.00000000,0.00000000,358.00000000); //object(waterjump1) (4)
    race_add_object(1634,1668.51770020,-1833.93615723,30.21217918,10.00000000,0.00000000,4.00000000); //object(landjump2) (16)
    race_add_object(1634,1672.40161133,-1834.02270508,30.21217918,9.99755859,0.00000000,357.99951172); //object(landjump2) (17)
    race_add_object(3865,1671.03271484,-1790.62475586,36.80608368,0.00000000,0.00000000,0.00000000); //object(concpipe_sfxrf) (1)
    race_add_object(3865,1671.15405273,-1782.62292480,35.12837601,340.00000000,0.00000000,0.00000000); //object(concpipe_sfxrf) (4)
    race_add_object(3865,1672.27124023,-1775.40979004,33.57907867,355.00000000,0.00000000,346.00000000); //object(concpipe_sfxrf) (5)
    race_add_object(3865,1675.03601074,-1767.73046875,32.78790665,354.99572754,0.00000000,335.99792480); //object(concpipe_sfxrf) (6)
    race_add_object(3865,1678.66076660,-1761.12194824,31.21790695,345.00000000,0.00000000,327.99487305); //object(concpipe_sfxrf) (7)
    race_add_object(3865,1681.70947266,-1754.21289062,29.01790619,344.99816895,0.00000000,341.99133301); //object(concpipe_sfxrf) (8)
    race_add_object(3865,1682.71960449,-1746.98266602,26.81790543,344.99267578,0.00000000,359.98791504); //object(concpipe_sfxrf) (9)
    race_add_object(3865,1681.65417480,-1739.36267090,25.01790428,350.00000000,0.00000000,15.98352051); //object(concpipe_sfxrf) (10)
    race_add_object(3865,1678.85656738,-1731.52844238,24.01790428,0.00000000,0.00000000,23.97961426); //object(concpipe_sfxrf) (11)
    race_add_object(3865,1675.49792480,-1724.26013184,23.01790428,350.00000000,0.00000000,27.97766113); //object(concpipe_sfxrf) (12)
    race_add_object(3865,1666.53222656,-1790.70312500,36.80608368,0.00000000,0.00000000,0.00000000); //object(concpipe_sfxrf) (13)
    race_add_object(3865,1676.06274414,-1790.75354004,36.80608368,0.00000000,0.00000000,0.00000000); //object(concpipe_sfxrf) (14)
    race_add_object(3865,1676.23059082,-1781.73095703,36.80608368,0.00000000,0.00000000,0.00000000); //object(concpipe_sfxrf) (15)
    race_add_object(3865,1675.94775391,-1774.99438477,36.80608368,0.00000000,0.00000000,4.00000000); //object(concpipe_sfxrf) (16)
    race_add_object(3865,1675.21057129,-1766.27087402,36.80608368,0.00000000,0.00000000,5.99902344); //object(concpipe_sfxrf) (17)
    race_add_object(3865,1674.37011719,-1758.06005859,35.90608215,350.00000000,0.00000000,5.99853516); //object(concpipe_sfxrf) (18)
    race_add_object(3865,1673.75805664,-1752.34326172,34.40608215,345.00000000,0.00000000,5.99853516); //object(concpipe_sfxrf) (19)
    race_add_object(3865,1673.27416992,-1747.34057617,32.60608292,340.00000000,0.00000000,5.99853516); //object(concpipe_sfxrf) (20)
    race_add_object(3865,1672.14501953,-1739.17846680,29.60608292,339.99938965,0.00000000,9.99853516); //object(concpipe_sfxrf) (21)
    race_add_object(3865,1670.69494629,-1731.81872559,26.80608368,339.99938965,0.00000000,11.99755859); //object(concpipe_sfxrf) (22)
    race_add_object(3865,1669.36145020,-1727.00073242,25.30608368,345.00000000,0.00000000,15.99707031); //object(concpipe_sfxrf) (23)
    race_add_object(3865,1666.17773438,-1782.46118164,36.80608368,0.00000000,0.00000000,6.00000000); //object(concpipe_sfxrf) (24)
    race_add_object(3865,1665.63159180,-1773.71545410,35.80608368,350.00000000,0.00000000,1.99853516); //object(concpipe_sfxrf) (25)
    race_add_object(3865,1665.57226562,-1766.21484375,33.60608292,340.00000000,0.00000000,359.99401855); //object(concpipe_sfxrf) (26)
    race_add_object(3865,1665.23071289,-1759.48181152,31.00608253,339.99938965,0.00000000,5.98901367); //object(concpipe_sfxrf) (27)
    race_add_object(3865,1664.64111328,-1751.47680664,28.30608177,344.00000000,0.00000000,3.98754883); //object(concpipe_sfxrf) (28)
    race_add_object(3865,1664.30981445,-1743.18566895,26.40608215,350.00000000,0.00000000,3.98254395); //object(concpipe_sfxrf) (29)
    race_add_object(3865,1663.72351074,-1735.45703125,25.80608177,0.00000000,0.00000000,5.98254395); //object(concpipe_sfxrf) (30)
    race_add_object(3865,1662.73144531,-1726.76257324,25.80608177,0.00000000,0.00000000,7.98205566); //object(concpipe_sfxrf) (31)
    race_add_object(1634,1649.43347168,-1665.19409180,21.73481750,0.00000000,0.00000000,352.00000000); //object(landjump2) (20)
    race_add_object(1634,1652.39184570,-1665.82812500,21.73481750,0.00000000,0.00000000,347.99645996); //object(landjump2) (21)

    return 1;
}
