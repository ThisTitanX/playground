// Copyright 2006-2015 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the GPLv2 license, a copy of which can
// be found in the LICENSE file.

// Las Venturas Playground v2.94.0 - Race 23 (SkyRace) 
// This race was created ingame on 12/5/2011.
// Copyright(c) Las Venturas Playground 2011 - www.sa-mp.nl


#define RACE23 23

race_start(RACE23)
{

    race_set_id( RACE23 );
    race_set_name( "Sky" );
    race_set_maxtime( 500 );
    race_set_vehicle( 411 );
    race_set_weather( 10 );
    race_set_maydrop( 0 );
    race_set_airrace( 0 );
    race_set_time( 12, 0 );
    race_set_laps( 1 );
    race_set_interior( 0 ); 
    race_set_nos( 1 ); 

    race_set_type( RACE_TYPE_KNOCKOUT );


    race_add_spawn( 3528.613281, 2101.510986, 139.546005, 177.845397, -1, -1 );
    race_add_spawn( 3536.899902, 2101.438476, 139.546051, 181.575454, -1, -1 );
    race_add_spawn( 3518.110351, 2101.063964, 139.546066, 184.221511, -1, -1 );
    race_add_spawn( 3524.376953, 2101.678466, 139.546066, 181.162368, -1, -1 );

    race_add_checkpoint( 3527.100097, 1992.475830, 139.647552, 10.000000 );
    race_add_checkpoint( 3486.921142, 1962.824340, 139.896102, 10.000000 );
    race_add_checkpoint( 3305.651855, 2082.029296, 81.773185, 10.000000 );
    race_add_checkpoint( 3330.784667, 1982.396728, 81.479309, 10.000000 );
    race_add_checkpoint( 3235.174804, 2178.523437, 108.377189, 10.000000 );
    race_add_checkpoint( 3387.848876, 2278.620849, 142.381774, 10.000000 );
    race_add_checkpoint( 3555.010009, 2291.717041, 142.333175, 10.000000 );
    race_add_checkpoint( 3598.816650, 2384.905029, 142.435226, 10.000000 );
    race_add_checkpoint( 3673.149902, 2554.613769, 142.448211, 10.000000 );
    race_add_checkpoint( 3682.258544, 2281.926025, 142.494338, 10.000000 );
    race_add_checkpoint( 3867.392578, 2124.899169, 142.370178, 10.000000 );
    race_add_checkpoint( 3998.902832, 2181.640136, 142.126342, 10.000000 );
    race_add_checkpoint( 3515.553222, 2177.947509, 139.792724, 10.000000 );

    race_add_object(8355,3679.480,2261.634,141.767,0.0,0.0,0.0);
    race_add_object(8354,3702.395,2124.512,141.691,0.0,0.0,90.000);
    race_add_object(8355,3679.455,2399.234,141.769,0.0,0.0,0.0);
    race_add_object(8355,3841.245,2124.583,141.643,0.0,0.0,-90.000);
    race_add_object(8355,3979.278,2124.592,141.520,0.0,0.0,-90.000);
    race_add_object(5005,3662.934,2385.155,145.195,0.0,0.0,90.000);
    race_add_object(5005,3695.961,2382.762,145.320,0.0,0.0,90.000);
    race_add_object(5005,3695.983,2220.046,145.318,0.0,0.0,90.000);
    race_add_object(5005,3662.843,2222.288,145.168,0.0,0.0,90.000);
    race_add_object(5001,3683.833,2168.556,144.563,0.0,0.0,-90.000);
    race_add_object(5005,3778.621,2140.921,145.317,0.0,0.0,180.000);
    race_add_object(5005,3789.815,2108.870,145.194,0.0,0.0,180.000);
    race_add_object(5030,3970.509,2116.714,145.147,0.0,0.0,0.0);
    race_add_object(5030,3937.313,2148.724,145.195,0.0,0.0,0.0);
    race_add_object(8355,4005.746,2139.997,141.497,0.0,0.0,-90.000);
    race_add_object(5005,4072.438,2203.500,145.098,0.0,0.0,90.000);
    race_add_object(5007,4049.849,2125.559,145.284,0.0,1.719,0.0);
    race_add_object(8355,4005.831,2179.412,141.399,0.0,0.0,-270.000);
    race_add_object(5005,3968.638,2195.998,144.950,0.0,0.0,180.000);
    race_add_object(5005,3857.670,2156.569,145.073,0.0,0.0,180.000);
    race_add_object(5005,3805.892,2196.054,144.950,0.0,0.0,180.000);
    race_add_object(8355,3868.479,2179.331,141.376,0.0,0.0,-270.000);
    race_add_object(8355,3867.755,2148.449,141.327,0.0,0.0,-270.000);
    race_add_object(5005,3779.686,2156.575,144.927,0.0,0.0,180.000);
    race_add_object(8355,3730.207,2179.320,141.277,0.0,0.0,-270.000);
    race_add_object(8355,3762.242,2148.374,141.229,0.0,0.0,-270.000);
    race_add_object(1634,3718.196,2185.296,142.350,0.0,0.0,90.000);
    race_add_object(1634,3718.194,2181.278,142.350,0.0,0.0,90.000);
    race_add_object(1634,3718.194,2177.188,142.350,0.0,0.0,90.000);
    race_add_object(1634,3718.227,2173.031,142.325,0.0,0.0,90.000);
    race_add_object(8355,3592.930,2177.898,139.238,0.0,0.0,-270.000);
    race_add_object(5005,3578.489,2194.106,142.790,0.0,0.0,0.0);
    race_add_object(5005,3578.982,2161.543,142.790,0.0,0.0,0.0);
    race_add_object(8355,3536.456,2178.139,139.090,0.0,0.0,-270.000);
    race_add_object(5001,3527.627,2171.134,141.962,0.0,0.0,-180.000);
    race_add_object(5001,3490.962,2177.468,141.962,0.0,0.0,-90.000);
    race_add_object(5007,3522.722,2078.243,141.630,0.0,0.0,0.0);
    race_add_object(8355,3487.406,2092.552,139.043,0.0,0.0,-360.000);
    race_add_object(8355,3526.078,2092.860,138.819,0.0,0.0,-360.000);
    race_add_object(5005,3513.213,2038.567,142.594,0.0,0.0,-90.000);
    race_add_object(8355,3526.095,1957.654,138.921,0.0,0.0,-360.000);
    race_add_object(5005,3545.562,1970.791,142.247,0.0,0.0,-90.000);
    race_add_object(8355,3487.424,1954.865,139.169,0.0,0.0,-360.000);
    race_add_object(5005,3480.124,1931.479,142.222,0.0,0.0,-213.750);
    race_add_object(5005,3468.122,2020.505,142.496,0.0,0.0,-90.000);
    race_add_object(5001,3490.306,2069.898,141.914,0.0,0.0,-270.000);
    race_add_object(8355,3406.638,2112.959,107.069,-332.602,0.0,-87.800);
    race_add_object(5005,3397.091,2096.363,105.577,0.0,27.502,-177.422);
    race_add_object(5005,3395.338,2127.596,104.984,0.0,27.502,-537.422);
    race_add_object(8344,3336.107,2086.745,81.046,0.0,0.0,-90.000);
    race_add_object(8343,3338.274,2040.828,80.973,0.0,0.0,-586.014);
    race_add_object(5007,3350.578,2102.698,83.123,0.0,0.0,93.360);
    race_add_object(5007,3298.153,2083.917,83.934,0.0,0.0,183.360);
    race_add_object(8343,3426.915,2059.446,80.875,0.0,0.0,-766.014);
    race_add_object(8344,3431.122,2014.273,80.899,0.0,0.0,-265.625);
    race_add_object(5007,3415.400,1994.954,83.336,0.0,-0.859,274.924);
    race_add_object(5007,3464.405,2021.678,83.786,0.0,-0.859,4.847);
    race_add_object(8355,3300.009,1979.030,80.751,0.0,0.0,-624.843);
    race_add_object(5005,3349.496,1998.076,84.302,0.0,0.0,5.234);
    race_add_object(5005,3314.316,1963.110,84.352,0.0,0.0,5.234);
    race_add_object(8355,3246.782,2062.122,80.703,0.0,0.0,-714.843);
    race_add_object(5005,3233.100,2039.158,83.802,0.0,0.0,-84.766);
    race_add_object(5005,3262.620,2073.418,83.954,0.0,0.0,-84.766);
    race_add_object(8355,3237.016,2183.497,110.054,-332.602,0.0,3.997);
    race_add_object(5005,3253.488,2174.156,107.694,0.0,27.502,-445.703);
    race_add_object(5005,3222.664,2171.574,107.848,0.0,27.502,-85.703);
    race_add_object(8355,3279.412,2268.091,141.702,0.0,0.0,-805.702);
    race_add_object(5005,3292.314,2287.952,145.003,0.0,0.0,-175.625);
    race_add_object(5005,3330.560,2252.065,144.853,0.0,0.0,-175.625);
    race_add_object(8355,3416.543,2278.426,141.654,0.0,0.0,-805.702);
    race_add_object(5005,3432.079,2298.532,145.080,0.0,0.0,-175.625);
    race_add_object(5005,3484.964,2263.707,144.805,0.0,0.0,-175.625);
    race_add_object(8355,3553.034,2288.759,141.606,0.0,0.0,-805.702);
    race_add_object(5005,3544.101,2268.111,144.832,0.0,0.0,-175.625);
    race_add_object(5005,3502.652,2304.160,144.982,0.0,0.0,-175.625);
    race_add_object(8355,3595.769,2379.270,141.708,0.0,0.0,-715.703);
    race_add_object(5005,3616.960,2356.565,144.884,0.0,0.0,-85.625);
    race_add_object(5005,3575.162,2392.692,144.959,0.0,0.0,-85.625);
    race_add_object(8344,3655.306,2528.700,141.721,0.0,0.0,180.000);
    race_add_object(8343,3615.302,2545.526,141.673,0.0,0.0,0.0);
    race_add_object(8355,3591.505,2484.841,141.659,0.0,0.0,-719.140);
    race_add_object(5005,3573.338,2488.463,144.884,0.0,0.0,-94.220);
    race_add_object(5007,3673.143,2511.073,144.609,0.0,0.0,0.0);
    race_add_object(5007,3657.246,2561.887,144.609,0.0,0.0,78.750);
    race_add_object(1634,3718.111,2189.418,142.375,0.0,0.0,90.000);
    race_add_object(1634,3718.225,2168.888,142.325,0.0,0.0,90.000);
    race_add_object(1634,3718.220,2164.794,142.325,0.0,0.0,90.000);
    race_add_object(1634,3718.215,2160.940,142.325,0.0,0.0,90.000);
    race_add_object(1634,3718.125,2193.245,142.375,0.0,0.0,90.000);
    race_add_object(1237,3340.627,2091.574,81.049,0.0,0.0,0.0);
    race_add_object(1237,3336.035,2091.384,81.049,0.0,0.0,0.0);
    race_add_object(1237,3330.480,2090.657,81.049,0.0,0.0,0.0);
    race_add_object(1237,3324.934,2088.993,81.049,0.0,0.0,0.0);
    race_add_object(1237,3319.990,2085.575,81.049,0.0,0.0,0.0);
    race_add_object(1237,3315.905,2080.973,81.049,0.0,0.0,0.0);
    race_add_object(1237,3313.156,2075.557,81.049,0.0,0.0,0.0);
    race_add_object(1237,3311.490,2068.492,81.049,0.0,0.0,0.0);
    race_add_object(1237,3312.126,2061.521,81.049,0.0,0.0,0.0);
    race_add_object(1237,3314.046,2055.730,81.049,0.0,0.0,0.0);
    race_add_object(1237,3317.238,2050.962,81.049,0.0,0.0,0.0);
    race_add_object(1237,3322.463,2046.092,81.049,0.0,0.0,0.0);
    race_add_object(1237,3329.227,2042.962,80.976,0.0,0.0,0.0);
    race_add_object(1237,3338.104,2042.184,80.976,0.0,0.0,0.0);
    race_add_object(1237,3347.030,2044.776,80.976,0.0,0.0,0.0);
    race_add_object(1237,3354.457,2050.118,81.026,0.0,0.0,0.0);
    race_add_object(1237,3362.432,2057.874,80.976,0.0,0.0,0.0);
    race_add_object(1237,3370.418,2065.614,80.977,0.0,0.0,0.0);
    race_add_object(1237,3383.756,2078.104,80.977,0.0,0.0,0.0);
    race_add_object(1237,3376.880,2071.784,80.977,0.0,0.0,0.0);
    race_add_object(1237,3389.853,2083.117,80.977,0.0,0.0,0.0);
    race_add_object(1237,3396.502,2088.070,80.977,0.0,0.0,0.0);
    race_add_object(1237,3403.740,2092.145,80.977,0.0,0.0,0.0);
    race_add_object(1237,3412.306,2094.806,80.977,0.0,0.0,0.0);
    race_add_object(1237,3421.187,2096.715,80.977,0.0,0.0,0.0);
    race_add_object(1237,3357.681,2007.226,80.976,0.0,0.0,0.0);
    race_add_object(1237,3379.670,2020.743,80.976,0.0,0.0,0.0);
    race_add_object(1237,3368.476,2011.868,80.976,0.0,0.0,0.0);
    race_add_object(1237,3388.239,2028.368,80.976,0.0,0.0,0.0);
    race_add_object(1237,3399.380,2039.252,80.976,0.0,0.0,0.0);
    race_add_object(1237,3408.338,2047.730,80.977,0.0,0.0,0.0);
    race_add_object(1237,3418.253,2055.960,80.977,0.0,0.0,0.0);
    race_add_object(1237,3437.521,2058.277,80.977,0.0,0.0,0.0);
    race_add_object(1237,3427.466,2059.182,80.977,0.0,0.0,0.0);
    race_add_object(1237,3445.279,2054.044,80.977,0.0,0.0,0.0);
    race_add_object(1237,3451.039,2047.129,80.977,0.0,0.0,0.0);
    race_add_object(1237,3454.641,2031.567,80.977,0.0,0.0,0.0);
    race_add_object(1237,3454.144,2038.660,80.977,0.0,0.0,0.0);
    race_add_object(1237,3439.183,2010.279,80.902,0.0,0.0,0.0);
    race_add_object(1237,3452.410,2024.042,80.977,0.0,0.0,0.0);
    race_add_object(1237,3446.598,2016.108,80.902,0.0,0.0,0.0);
    race_add_object(5005,3211.048,2325.203,144.628,0.0,0.0,-445.625);
    race_add_object(1237,3610.165,2526.650,141.676,0.0,0.0,0.0);
    race_add_object(1237,3609.605,2513.960,141.676,0.0,0.0,0.0);
    race_add_object(1237,3614.866,2543.302,141.724,0.0,0.0,0.0);
    race_add_object(1237,3621.731,2549.755,141.724,0.0,0.0,0.0);
    race_add_object(1237,3610.012,2504.086,141.676,0.0,0.0,0.0);
    race_add_object(1237,3610.651,2494.205,141.662,0.0,0.0,0.0);
    race_add_object(1237,3610.646,2484.893,141.662,0.0,0.0,0.0);
    race_add_object(1237,3611.030,2472.931,141.662,0.0,0.0,0.0);
    race_add_object(1237,3611.036,2462.049,141.662,0.0,0.0,0.0);
    race_add_object(1237,3611.366,2453.672,141.662,0.0,0.0,0.0);
    race_add_object(1237,3611.279,2439.690,141.711,0.0,0.0,0.0);
    race_add_object(1237,3660.420,2483.954,141.724,0.0,0.0,0.0);
    race_add_object(1237,3660.195,2511.171,141.724,0.0,0.0,0.0);
    race_add_object(1237,3660.884,2503.931,141.724,0.0,0.0,0.0);
    race_add_object(1237,3660.326,2521.761,141.724,0.0,0.0,0.0);
    race_add_object(1237,3660.302,2494.306,141.724,0.0,0.0,0.0);
    race_add_object(1237,3659.691,2533.708,141.724,0.0,0.0,0.0);
    race_add_object(1237,3655.979,2542.519,141.724,0.0,0.0,0.0);
    race_add_object(1237,3638.969,2553.780,141.724,0.0,0.0,0.0);
    race_add_object(1237,3647.376,2550.896,141.724,0.0,0.0,0.0);
    race_add_object(1237,3630.156,2553.329,141.724,0.0,0.0,0.0);
    race_add_object(1237,3610.881,2534.462,141.676,0.0,0.0,0.0);
    race_add_object(1237,3660.705,2474.033,141.724,0.0,0.0,0.0);

    return 1;
}
