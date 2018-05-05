//
// Verilog description for cell ALU, 
// Sat May  5 04:04:47 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module ALU ( Opr, A, B, Cin, Res1, Res2, Flags ) ;

    input [3:0]Opr ;
    input [15:0]A ;
    input [15:0]B ;
    input Cin ;
    output [15:0]Res1 ;
    output [15:0]Res2 ;
    output [3:0]Flags ;

    wire Add_Opr_2_15, Add_Opr_2_14, Add_Opr_2_13, Add_Opr_2_12, Add_Opr_2_11, 
         Add_Opr_2_10, Add_Opr_2_9, Add_Opr_2_8, Add_Opr_2_7, Add_Opr_2_6, 
         Add_Opr_2_5, Add_Opr_2_4, Add_Opr_2_3, Add_Opr_2_2, Add_Opr_2_1, 
         Add_Opr_2_0, Add_Res_15, Add_Res_14, Add_Res_13, Add_Res_12, Add_Res_11, 
         Add_Res_10, Add_Res_9, Add_Res_8, Add_Res_7, Add_Res_6, Add_Res_5, 
         Add_Res_4, Add_Res_3, Add_Res_2, Add_Res_1, Add_Res_0, Add_Cout, nx0, 
         nx14, nx20, nx26, nx28, nx36, nx46, nx52, nx56, nx58, nx64, nx66, nx70, 
         nx72, nx74, nx80, nx86, nx88, nx94, nx98, nx100, nx104, nx106, nx112, 
         nx118, nx120, nx126, nx130, nx136, nx138, nx144, nx156, nx160, nx164, 
         nx170, nx192, nx198, nx202, nx206, nx220, nx234, nx236, nx262, nx266, 
         nx268, nx272, nx274, nx276, nx284, nx286, nx302, nx304, nx354, nx358, 
         nx360, nx364, nx366, nx370, nx372, nx376, nx378, nx380, nx388, nx390, 
         nx398, nx400, nx408, nx410, nx426, nx428, nx502, nx506, nx508, nx512, 
         nx514, nx518, nx520, nx524, nx526, nx530, nx532, nx536, nx538, nx540, 
         nx548, nx550, nx558, nx560, nx568, nx570, nx578, nx580, nx588, nx590, 
         nx606, nx608, nx706, nx710, nx712, nx716, nx718, nx722, nx724, nx728, 
         nx730, nx734, nx736, nx740, nx742, nx746, nx748, nx752, nx754, nx756, 
         nx764, nx766, nx774, nx776, nx784, nx786, nx794, nx796, nx804, nx806, 
         nx814, nx816, nx824, nx826, nx842, nx844, nx966, nx970, nx972, nx976, 
         nx978, nx982, nx984, nx988, nx990, nx994, nx996, nx1000, nx1002, nx1006, 
         nx1008, nx1012, nx1014, nx1018, nx1020, nx1024, nx1026, nx1028, nx1036, 
         nx1038, nx1046, nx1048, nx1056, nx1058, nx1066, nx1068, nx1076, nx1078, 
         nx1086, nx1088, nx1096, nx1098, nx1106, nx1108, nx1116, nx1118, nx1134, 
         nx1136, nx1142, nx1284, nx1288, nx1290, nx1294, nx1296, nx1300, nx1302, 
         nx1306, nx1308, nx1312, nx1314, nx1318, nx1320, nx1324, nx1326, nx1330, 
         nx1332, nx1336, nx1338, nx1342, nx1344, nx1348, nx1350, nx1354, nx1356, 
         nx1358, nx1364, nx1366, nx1372, nx1374, nx1380, nx1382, nx1388, nx1390, 
         nx1396, nx1398, nx1404, nx1406, nx1412, nx1414, nx1420, nx1422, nx1428, 
         nx1430, nx1436, nx1438, nx1444, nx1446, nx1458, nx1460, nx1466, nx1468, 
         nx1472, nx1476, nx1480, nx1484, nx1488, nx1492, nx1496, nx1500, nx1504, 
         nx1508, nx1512, nx1516, nx1520, nx1632, nx1636, nx1638, nx1642, nx1644, 
         nx1648, nx1650, nx1654, nx1656, nx1660, nx1662, nx1666, nx1668, nx1672, 
         nx1674, nx1678, nx1680, nx1684, nx1686, nx1690, nx1692, nx1696, nx1698, 
         nx1702, nx1704, nx1708, nx1710, nx1712, nx1722, nx1730, nx1734, nx1760, 
         nx1764, nx1776, nx1782, nx1786, nx1794, nx1812, nx1822, nx1832, nx1842, 
         nx1852, nx1862, nx1872, nx1882, nx1892, nx1902, nx1912, nx1922, nx1932, 
         nx1952, nx1956, nx1960, nx1964, nx1968, nx1972, nx1976, nx1980, nx1984, 
         nx1988, nx1992, nx1996, nx2000, nx2004, nx2006, nx2012, nx2016, nx2018, 
         nx2026, nx2028, nx2036, nx2038, nx2046, nx2048, nx2056, nx2058, nx2066, 
         nx2068, nx2076, nx2078, nx2086, nx2088, nx2096, nx2098, nx2106, nx2108, 
         nx2116, nx2118, nx2126, nx2128, nx2204, nx2210, nx2214, nx2216, nx2224, 
         nx2226, nx2234, nx2236, nx2244, nx2246, nx2254, nx2256, nx2264, nx2266, 
         nx2274, nx2276, nx2284, nx2286, nx2294, nx2296, nx2304, nx2306, nx2314, 
         nx2316, nx2388, nx2394, nx2398, nx2400, nx2408, nx2410, nx2418, nx2420, 
         nx2428, nx2430, nx2438, nx2440, nx2448, nx2450, nx2458, nx2460, nx2468, 
         nx2470, nx2478, nx2480, nx2488, nx2490, nx2558, nx2564, nx2568, nx2570, 
         nx2578, nx2580, nx2588, nx2590, nx2598, nx2600, nx2608, nx2610, nx2618, 
         nx2620, nx2628, nx2630, nx2638, nx2640, nx2648, nx2650, nx2714, nx2720, 
         nx2724, nx2726, nx2734, nx2736, nx2744, nx2746, nx2754, nx2756, nx2764, 
         nx2766, nx2774, nx2776, nx2784, nx2786, nx2794, nx2796, nx2856, nx2862, 
         nx2866, nx2868, nx2876, nx2878, nx2886, nx2888, nx2896, nx2898, nx2906, 
         nx2908, nx2916, nx2918, nx2926, nx2928, nx2984, nx2990, nx2994, nx2996, 
         nx3004, nx3006, nx3014, nx3016, nx3024, nx3026, nx3034, nx3036, nx3044, 
         nx3046, nx3098, nx3104, nx3108, nx3110, nx3118, nx3120, nx3128, nx3130, 
         nx3138, nx3140, nx3148, nx3150, nx3198, nx3204, nx3208, nx3210, nx3218, 
         nx3220, nx3228, nx3230, nx3238, nx3240, nx3284, nx3290, nx3294, nx3296, 
         nx3304, nx3306, nx3314, nx3316, nx3356, nx3362, nx3366, nx3368, nx3376, 
         nx3378, nx3414, nx3420, nx3424, nx3426, nx3458, nx3464, nx3488, nx3500, 
         nx3504, nx3508, nx3512, nx3516, nx3520, nx3524, nx3528, nx3532, nx3536, 
         nx3540, nx3544, nx3548, nx3552, nx3556, nx3560, nx3572, nx3660, nx3666, 
         nx3686, nx3708, nx3752, nx3762, nx3770, nx3778, nx3784, nx3800, nx3810, 
         nx3814, nx3816, nx3824, nx3834, nx3838, nx3848, nx3858, nx3862, nx3866, 
         nx3870, nx3894, nx3908, nx3916, nx3920, nx3926, nx3936, nx3940, nx3948, 
         nx3958, nx3962, nx3972, nx3980, nx3984, nx4018, nx4044, nx4052, nx4062, 
         nx4070, nx4074, nx4088, nx4110, nx4118, nx4138, nx4146, nx4156, nx4164, 
         nx4178, nx4216, nx4224, nx4232, nx4240, nx4246, nx4260, nx4300, nx4308, 
         nx4324, nx4368, nx4376, nx4384, nx4400, nx4448, nx4486, nx4496, nx4510, 
         nx4532, nx4540, nx4572, nx4596, nx4634, nx4656, nx4664, nx4696, nx4734, 
         nx4742, nx4746, nx4762, nx4798, nx4814, nx4856, nx4862, nx4878, nx4916, 
         nx803, nx807, nx811, nx815, nx819, nx823, nx827, nx831, nx835, nx839, 
         nx843, nx847, nx851, nx855, nx859, nx863, nx903, nx905, nx907, nx911, 
         nx913, nx915, nx919, nx921, nx923, nx927, nx929, nx931, nx935, nx937, 
         nx939, nx943, nx945, nx947, nx951, nx953, nx955, nx959, nx961, nx963, 
         nx967, nx969, nx971, nx975, nx977, nx979, nx983, nx985, nx987, nx991, 
         nx993, nx995, nx999, nx1001, nx1003, nx1005, nx1007, nx1009, nx1015, 
         nx1017, nx1019, nx1021, nx1023, nx1025, nx1027, nx1029, nx1031, nx1033, 
         nx1035, nx1037, nx1039, nx1041, nx1043, nx1045, nx1047, nx1049, nx1051, 
         nx1053, nx1055, nx1057, nx1059, nx1061, nx1063, nx1065, nx1073, nx1075, 
         nx1077, nx1079, nx1081, nx1083, nx1133, nx1139, nx1141, nx1143, nx1145, 
         nx1147, nx1149, nx1151, nx1153, nx1155, nx1157, nx1159, nx1161, nx1163, 
         nx1165, nx1167, nx1169, nx1171, nx1173, nx1175, nx1177, nx1179, nx1181, 
         nx1183, nx1185, nx1187, nx1189, nx1195, nx1201, nx1203, nx1205, nx1251, 
         nx1257, nx1259, nx1261, nx1263, nx1265, nx1267, nx1269, nx1271, nx1273, 
         nx1275, nx1277, nx1279, nx1281, nx1283, nx1285, nx1287, nx1289, nx1291, 
         nx1293, nx1295, nx1297, nx1299, nx1301, nx1303, nx1305, nx1307, nx1313, 
         nx1323, nx1325, nx1327, nx1369, nx1375, nx1377, nx1379, nx1381, nx1383, 
         nx1385, nx1387, nx1389, nx1391, nx1393, nx1395, nx1397, nx1399, nx1401, 
         nx1403, nx1405, nx1407, nx1409, nx1411, nx1413, nx1415, nx1417, nx1419, 
         nx1421, nx1423, nx1425, nx1431, nx1445, nx1447, nx1449, nx1487, nx1493, 
         nx1495, nx1497, nx1499, nx1501, nx1503, nx1505, nx1507, nx1509, nx1511, 
         nx1513, nx1515, nx1517, nx1519, nx1521, nx1523, nx1525, nx1527, nx1529, 
         nx1531, nx1533, nx1535, nx1537, nx1539, nx1541, nx1543, nx1549, nx1567, 
         nx1569, nx1571, nx1605, nx1611, nx1613, nx1615, nx1617, nx1619, nx1621, 
         nx1623, nx1625, nx1627, nx1629, nx1631, nx1633, nx1635, nx1637, nx1639, 
         nx1641, nx1643, nx1645, nx1647, nx1649, nx1651, nx1653, nx1655, nx1657, 
         nx1659, nx1661, nx1667, nx1689, nx1691, nx1693, nx1723, nx1727, nx1729, 
         nx1731, nx1733, nx1735, nx1737, nx1739, nx1741, nx1743, nx1745, nx1747, 
         nx1749, nx1751, nx1753, nx1755, nx1757, nx1759, nx1761, nx1763, nx1765, 
         nx1767, nx1769, nx1771, nx1773, nx1775, nx1777, nx1781, nx1803, nx1805, 
         nx1807, nx1833, nx1839, nx1841, nx1843, nx1845, nx1847, nx1849, nx1851, 
         nx1853, nx1855, nx1857, nx1859, nx1861, nx1863, nx1865, nx1867, nx1869, 
         nx1871, nx1873, nx1875, nx1877, nx1879, nx1881, nx1883, nx1885, nx1887, 
         nx1889, nx1895, nx1925, nx1927, nx1929, nx1951, nx1957, nx1959, nx1961, 
         nx1963, nx1965, nx1967, nx1969, nx1971, nx1973, nx1975, nx1977, nx1979, 
         nx1981, nx1983, nx1985, nx1987, nx1989, nx1991, nx1993, nx1995, nx1997, 
         nx1999, nx2001, nx2003, nx2005, nx2007, nx2013, nx2047, nx2049, nx2051, 
         nx2069, nx2075, nx2077, nx2079, nx2081, nx2083, nx2085, nx2087, nx2089, 
         nx2091, nx2093, nx2095, nx2097, nx2099, nx2101, nx2103, nx2105, nx2107, 
         nx2109, nx2111, nx2113, nx2115, nx2117, nx2119, nx2121, nx2123, nx2125, 
         nx2131, nx2169, nx2171, nx2173, nx2187, nx2193, nx2195, nx2197, nx2199, 
         nx2201, nx2203, nx2205, nx2207, nx2209, nx2211, nx2213, nx2215, nx2217, 
         nx2219, nx2221, nx2223, nx2225, nx2227, nx2229, nx2231, nx2233, nx2235, 
         nx2237, nx2239, nx2241, nx2243, nx2249, nx2291, nx2293, nx2295, nx2305, 
         nx2311, nx2313, nx2315, nx2317, nx2319, nx2321, nx2323, nx2325, nx2327, 
         nx2329, nx2331, nx2333, nx2335, nx2337, nx2339, nx2341, nx2343, nx2345, 
         nx2347, nx2349, nx2351, nx2353, nx2355, nx2357, nx2359, nx2361, nx2367, 
         nx2413, nx2415, nx2417, nx2423, nx2427, nx2429, nx2431, nx2433, nx2435, 
         nx2437, nx2439, nx2441, nx2443, nx2445, nx2447, nx2449, nx2451, nx2453, 
         nx2455, nx2457, nx2459, nx2461, nx2463, nx2465, nx2467, nx2469, nx2471, 
         nx2473, nx2475, nx2477, nx2479, nx2481, nx2487, nx2537, nx2539, nx2541, 
         nx2601, nx2603, nx2609, nx2611, nx2617, nx2623, nx2629, nx2635, nx2641, 
         nx2647, nx2653, nx2659, nx2665, nx2671, nx2677, nx2683, nx2689, nx2693, 
         nx2697, nx2701, nx2705, nx2709, nx2713, nx2717, nx2721, nx2725, nx2729, 
         nx2733, nx2737, nx2741, nx2749, nx2753, nx2757, nx2761, nx2763, nx2773, 
         nx2775, nx2783, nx2785, nx2787, nx2789, nx2793, nx2795, nx2803, nx2807, 
         nx2811, nx2813, nx2819, nx2827, nx2831, nx2839, nx2845, nx2871, nx2875, 
         nx2881, nx2885, nx2887, nx2913, nx2917, nx2921, nx2923, nx2929, nx2933, 
         nx2935, nx2937, nx2945, nx2949, nx2985, nx2991, nx2993, nx2995, nx2999, 
         nx3001, nx3015, nx3017, nx3019, nx3021, nx3025, nx3027, nx3041, nx3043, 
         nx3045, nx3047, nx3051, nx3053, nx3057, nx3069, nx3071, nx3073, nx3075, 
         nx3079, nx3081, nx3089, nx3091, nx3093, nx3095, nx3099, nx3101, nx3111, 
         nx3113, nx3115, nx3117, nx3121, nx3123, nx3129, nx3135, nx3137, nx3139, 
         nx3143, nx3145, nx3153, nx3157, nx3159, nx3161, nx3165, nx3167, nx3171, 
         nx3177, nx3179, nx3181, nx3185, nx3187, nx3191, nx3193, nx3195, nx3197, 
         nx3201, nx3203, nx3209, nx3211, nx3213, nx3215, nx3219, nx3221, nx3229, 
         nx3231, nx3233, nx3235, nx3239, nx3241, nx3247, nx3249, nx3251, nx3253, 
         nx3257, nx3259, nx3267, nx3269, nx3271, nx3273, nx3275, nx3279, nx3281, 
         nx3283, nx3285, nx3289, nx3291, nx3293, nx3295, nx3299, nx3301, nx3303, 
         nx3305, nx3307, nx3309, nx3311, nx3313, nx3315, nx3319, nx3321, nx3363, 
         nx3367, nx3369, nx3371, nx3373, nx3375, nx3377, nx3379, nx3381, nx3383, 
         nx3385, nx3387, nx3389, nx3391, nx3393, nx3395, nx3397, nx3399, nx3401, 
         nx3403, nx3405, nx3407, nx3409, nx3411, nx3413, nx3415, nx3417, nx3419, 
         nx3421, nx3423, nx3425, nx3431, nx3433, nx3435, nx3437, nx3441, nx3443, 
         nx3445, nx3453, nx3455, nx3462, nx3465, nx3467, nx3469, nx3471, nx3473, 
         nx3475, nx3477, nx3479, nx3481, nx3483, nx3485, nx3487, nx3489, nx3491;



    adder_subtractor_16 ADD_SUB (.A ({B[15],B[14],B[13],B[12],B[11],B[10],B[9],
                        B[8],B[7],B[6],B[5],B[4],B[3],B[2],B[1],B[0]}), .B ({
                        Add_Opr_2_15,Add_Opr_2_14,Add_Opr_2_13,Add_Opr_2_12,
                        Add_Opr_2_11,Add_Opr_2_10,Add_Opr_2_9,Add_Opr_2_8,
                        Add_Opr_2_7,Add_Opr_2_6,Add_Opr_2_5,Add_Opr_2_4,
                        Add_Opr_2_3,Add_Opr_2_2,Add_Opr_2_1,Add_Opr_2_0}), .Cin (
                        Opr[1]), .Subtract (Opr[0]), .Sum ({Add_Res_15,
                        Add_Res_14,Add_Res_13,Add_Res_12,Add_Res_11,Add_Res_10,
                        Add_Res_9,Add_Res_8,Add_Res_7,Add_Res_6,Add_Res_5,
                        Add_Res_4,Add_Res_3,Add_Res_2,Add_Res_1,Add_Res_0}), .Cout (
                        Add_Cout)) ;
    fake_gnd ix738 (.Y (Flags[3])) ;
    inv01 ix804 (.Y (nx803), .A (A[0])) ;
    inv02 ix808 (.Y (nx807), .A (A[1])) ;
    inv01 ix812 (.Y (nx811), .A (A[2])) ;
    inv01 ix816 (.Y (nx815), .A (A[3])) ;
    inv01 ix820 (.Y (nx819), .A (A[4])) ;
    inv01 ix824 (.Y (nx823), .A (A[5])) ;
    inv01 ix828 (.Y (nx827), .A (A[6])) ;
    inv01 ix832 (.Y (nx831), .A (A[7])) ;
    inv01 ix836 (.Y (nx835), .A (A[8])) ;
    inv01 ix840 (.Y (nx839), .A (A[9])) ;
    inv01 ix844 (.Y (nx843), .A (A[10])) ;
    inv01 ix848 (.Y (nx847), .A (A[11])) ;
    inv01 ix852 (.Y (nx851), .A (A[12])) ;
    inv01 ix856 (.Y (nx855), .A (A[13])) ;
    inv01 ix860 (.Y (nx859), .A (A[14])) ;
    inv01 ix864 (.Y (nx863), .A (A[15])) ;
    nor02_2x ix4927 (.Y (Flags[0]), .A0 (Flags[1]), .A1 (nx2875)) ;
    mux21_ni ix3561 (.Y (nx3560), .A0 (nx1722), .A1 (nx3556), .S0 (nx2006)) ;
    mux21_ni ix3557 (.Y (nx3556), .A0 (nx2012), .A1 (nx3552), .S0 (nx2204)) ;
    xnor2 ix2013 (.Y (nx2012), .A0 (nx2000), .A1 (nx1005)) ;
    mux21_ni ix2001 (.Y (nx2000), .A0 (nx1996), .A1 (nx1822), .S0 (nx999)) ;
    mux21_ni ix1997 (.Y (nx1996), .A0 (nx1992), .A1 (nx1832), .S0 (nx991)) ;
    mux21_ni ix1993 (.Y (nx1992), .A0 (nx1988), .A1 (nx1842), .S0 (nx983)) ;
    mux21_ni ix1989 (.Y (nx1988), .A0 (nx1984), .A1 (nx1852), .S0 (nx975)) ;
    mux21_ni ix1985 (.Y (nx1984), .A0 (nx1980), .A1 (nx1862), .S0 (nx967)) ;
    mux21_ni ix1981 (.Y (nx1980), .A0 (nx1976), .A1 (nx1872), .S0 (nx959)) ;
    mux21_ni ix1977 (.Y (nx1976), .A0 (nx1972), .A1 (nx1882), .S0 (nx951)) ;
    mux21_ni ix1973 (.Y (nx1972), .A0 (nx1968), .A1 (nx1892), .S0 (nx943)) ;
    mux21_ni ix1969 (.Y (nx1968), .A0 (nx1964), .A1 (nx1902), .S0 (nx935)) ;
    mux21_ni ix1965 (.Y (nx1964), .A0 (nx1960), .A1 (nx1912), .S0 (nx927)) ;
    mux21_ni ix1961 (.Y (nx1960), .A0 (nx1956), .A1 (nx1922), .S0 (nx919)) ;
    mux21_ni ix1957 (.Y (nx1956), .A0 (nx1952), .A1 (nx1932), .S0 (nx911)) ;
    aoi21 ix1953 (.Y (nx1952), .A0 (nx903), .A1 (nx905), .B0 (nx907)) ;
    nand02 ix904 (.Y (nx903), .A0 (A[0]), .A1 (B[14])) ;
    nand02 ix906 (.Y (nx905), .A0 (A[2]), .A1 (B[14])) ;
    nand02 ix908 (.Y (nx907), .A0 (A[1]), .A1 (B[15])) ;
    xnor2 ix912 (.Y (nx911), .A0 (nx913), .A1 (nx915)) ;
    nand02 ix914 (.Y (nx913), .A0 (A[2]), .A1 (B[15])) ;
    nand02 ix916 (.Y (nx915), .A0 (A[3]), .A1 (B[14])) ;
    xnor2 ix920 (.Y (nx919), .A0 (nx921), .A1 (nx923)) ;
    nand02 ix922 (.Y (nx921), .A0 (A[3]), .A1 (B[15])) ;
    nand02 ix924 (.Y (nx923), .A0 (A[4]), .A1 (B[14])) ;
    xnor2 ix928 (.Y (nx927), .A0 (nx929), .A1 (nx931)) ;
    nand02 ix930 (.Y (nx929), .A0 (A[4]), .A1 (B[15])) ;
    nand02 ix932 (.Y (nx931), .A0 (A[5]), .A1 (B[14])) ;
    xnor2 ix936 (.Y (nx935), .A0 (nx937), .A1 (nx939)) ;
    nand02 ix938 (.Y (nx937), .A0 (A[5]), .A1 (B[15])) ;
    nand02 ix940 (.Y (nx939), .A0 (A[6]), .A1 (B[14])) ;
    xnor2 ix944 (.Y (nx943), .A0 (nx945), .A1 (nx947)) ;
    nand02 ix946 (.Y (nx945), .A0 (A[6]), .A1 (B[15])) ;
    nand02 ix948 (.Y (nx947), .A0 (A[7]), .A1 (B[14])) ;
    xnor2 ix952 (.Y (nx951), .A0 (nx953), .A1 (nx955)) ;
    nand02 ix954 (.Y (nx953), .A0 (A[7]), .A1 (B[15])) ;
    nand02 ix956 (.Y (nx955), .A0 (A[8]), .A1 (B[14])) ;
    xnor2 ix960 (.Y (nx959), .A0 (nx961), .A1 (nx963)) ;
    nand02 ix962 (.Y (nx961), .A0 (A[8]), .A1 (B[15])) ;
    nand02 ix964 (.Y (nx963), .A0 (A[9]), .A1 (B[14])) ;
    xnor2 ix968 (.Y (nx967), .A0 (nx969), .A1 (nx971)) ;
    nand02 ix970 (.Y (nx969), .A0 (A[9]), .A1 (B[15])) ;
    nand02 ix972 (.Y (nx971), .A0 (A[10]), .A1 (B[14])) ;
    xnor2 ix976 (.Y (nx975), .A0 (nx977), .A1 (nx979)) ;
    nand02 ix978 (.Y (nx977), .A0 (A[10]), .A1 (B[15])) ;
    nand02 ix980 (.Y (nx979), .A0 (A[11]), .A1 (B[14])) ;
    xnor2 ix984 (.Y (nx983), .A0 (nx985), .A1 (nx987)) ;
    nand02 ix986 (.Y (nx985), .A0 (A[11]), .A1 (B[15])) ;
    nand02 ix988 (.Y (nx987), .A0 (A[12]), .A1 (B[14])) ;
    xnor2 ix992 (.Y (nx991), .A0 (nx993), .A1 (nx995)) ;
    nand02 ix994 (.Y (nx993), .A0 (A[12]), .A1 (B[15])) ;
    nand02 ix996 (.Y (nx995), .A0 (A[13]), .A1 (B[14])) ;
    xnor2 ix1000 (.Y (nx999), .A0 (nx1001), .A1 (nx1003)) ;
    nand02 ix1002 (.Y (nx1001), .A0 (A[13]), .A1 (B[15])) ;
    nand02 ix1004 (.Y (nx1003), .A0 (B[14]), .A1 (A[14])) ;
    xnor2 ix1006 (.Y (nx1005), .A0 (nx1007), .A1 (nx1009)) ;
    nand02 ix1008 (.Y (nx1007), .A0 (A[14]), .A1 (B[15])) ;
    nand02 ix1010 (.Y (nx1009), .A0 (B[14]), .A1 (A[15])) ;
    mux21_ni ix3553 (.Y (nx3552), .A0 (nx2210), .A1 (nx3548), .S0 (nx2388)) ;
    xnor2 ix2211 (.Y (nx2210), .A0 (nx1015), .A1 (nx2018)) ;
    mux21_ni ix1016 (.Y (nx1015), .A0 (nx1017), .A1 (nx1019), .S0 (nx2028)) ;
    nand02 ix1018 (.Y (nx1017), .A0 (B[13]), .A1 (A[14])) ;
    mux21_ni ix1020 (.Y (nx1019), .A0 (nx1021), .A1 (nx1023), .S0 (nx2038)) ;
    nand02 ix1022 (.Y (nx1021), .A0 (B[13]), .A1 (A[13])) ;
    mux21_ni ix1024 (.Y (nx1023), .A0 (nx1025), .A1 (nx1027), .S0 (nx2048)) ;
    nand02 ix1026 (.Y (nx1025), .A0 (A[12]), .A1 (B[13])) ;
    mux21_ni ix1028 (.Y (nx1027), .A0 (nx1029), .A1 (nx1031), .S0 (nx2058)) ;
    nand02 ix1030 (.Y (nx1029), .A0 (A[11]), .A1 (B[13])) ;
    mux21_ni ix1032 (.Y (nx1031), .A0 (nx1033), .A1 (nx1035), .S0 (nx2068)) ;
    nand02 ix1034 (.Y (nx1033), .A0 (A[10]), .A1 (B[13])) ;
    mux21_ni ix1036 (.Y (nx1035), .A0 (nx1037), .A1 (nx1039), .S0 (nx2078)) ;
    nand02 ix1038 (.Y (nx1037), .A0 (A[9]), .A1 (B[13])) ;
    mux21_ni ix1040 (.Y (nx1039), .A0 (nx1041), .A1 (nx1043), .S0 (nx2088)) ;
    nand02 ix1042 (.Y (nx1041), .A0 (A[8]), .A1 (B[13])) ;
    mux21_ni ix1044 (.Y (nx1043), .A0 (nx1045), .A1 (nx1047), .S0 (nx2098)) ;
    nand02 ix1046 (.Y (nx1045), .A0 (A[7]), .A1 (B[13])) ;
    mux21_ni ix1048 (.Y (nx1047), .A0 (nx1049), .A1 (nx1051), .S0 (nx2108)) ;
    nand02 ix1050 (.Y (nx1049), .A0 (A[6]), .A1 (B[13])) ;
    mux21_ni ix1052 (.Y (nx1051), .A0 (nx1053), .A1 (nx1055), .S0 (nx2118)) ;
    nand02 ix1054 (.Y (nx1053), .A0 (A[5]), .A1 (B[13])) ;
    mux21_ni ix1056 (.Y (nx1055), .A0 (nx1057), .A1 (nx1059), .S0 (nx2128)) ;
    nand02 ix1058 (.Y (nx1057), .A0 (A[4]), .A1 (B[13])) ;
    mux21_ni ix1060 (.Y (nx1059), .A0 (nx1061), .A1 (nx1077), .S0 (nx1079)) ;
    mux21_ni ix1062 (.Y (nx1061), .A0 (nx1063), .A1 (nx1065), .S0 (nx1636)) ;
    nand02 ix1064 (.Y (nx1063), .A0 (A[2]), .A1 (B[13])) ;
    nand03 ix1066 (.Y (nx1065), .A0 (nx3387), .A1 (B[13]), .A2 (B[14])) ;
    xnor2 ix1637 (.Y (nx1636), .A0 (nx1632), .A1 (nx1063)) ;
    nor02ii ix1633 (.Y (nx1632), .A0 (nx1073), .A1 (nx1075)) ;
    aoi22 ix1074 (.Y (nx1073), .A0 (A[1]), .A1 (B[14]), .B0 (A[0]), .B1 (B[15])
          ) ;
    nand04 ix1076 (.Y (nx1075), .A0 (A[1]), .A1 (B[15]), .A2 (A[0]), .A3 (B[14])
           ) ;
    nand02 ix1078 (.Y (nx1077), .A0 (A[3]), .A1 (B[13])) ;
    xnor2 ix1080 (.Y (nx1079), .A0 (nx1081), .A1 (nx1077)) ;
    xnor2 ix1082 (.Y (nx1081), .A0 (nx1075), .A1 (nx1083)) ;
    xnor2 ix1084 (.Y (nx1083), .A0 (nx907), .A1 (nx905)) ;
    xnor2 ix2129 (.Y (nx2128), .A0 (nx2126), .A1 (nx1057)) ;
    xnor2 ix2127 (.Y (nx2126), .A0 (nx1952), .A1 (nx911)) ;
    xnor2 ix2119 (.Y (nx2118), .A0 (nx2116), .A1 (nx1053)) ;
    xnor2 ix2117 (.Y (nx2116), .A0 (nx1956), .A1 (nx919)) ;
    xnor2 ix2109 (.Y (nx2108), .A0 (nx2106), .A1 (nx1049)) ;
    xnor2 ix2107 (.Y (nx2106), .A0 (nx1960), .A1 (nx927)) ;
    xnor2 ix2099 (.Y (nx2098), .A0 (nx2096), .A1 (nx1045)) ;
    xnor2 ix2097 (.Y (nx2096), .A0 (nx1964), .A1 (nx935)) ;
    xnor2 ix2089 (.Y (nx2088), .A0 (nx2086), .A1 (nx1041)) ;
    xnor2 ix2087 (.Y (nx2086), .A0 (nx1968), .A1 (nx943)) ;
    xnor2 ix2079 (.Y (nx2078), .A0 (nx2076), .A1 (nx1037)) ;
    xnor2 ix2077 (.Y (nx2076), .A0 (nx1972), .A1 (nx951)) ;
    xnor2 ix2069 (.Y (nx2068), .A0 (nx2066), .A1 (nx1033)) ;
    xnor2 ix2067 (.Y (nx2066), .A0 (nx1976), .A1 (nx959)) ;
    xnor2 ix2059 (.Y (nx2058), .A0 (nx2056), .A1 (nx1029)) ;
    xnor2 ix2057 (.Y (nx2056), .A0 (nx1980), .A1 (nx967)) ;
    xnor2 ix2049 (.Y (nx2048), .A0 (nx2046), .A1 (nx1025)) ;
    xnor2 ix2047 (.Y (nx2046), .A0 (nx1984), .A1 (nx975)) ;
    xnor2 ix2039 (.Y (nx2038), .A0 (nx2036), .A1 (nx1021)) ;
    xnor2 ix2037 (.Y (nx2036), .A0 (nx1988), .A1 (nx983)) ;
    xnor2 ix2029 (.Y (nx2028), .A0 (nx2026), .A1 (nx1017)) ;
    xnor2 ix2027 (.Y (nx2026), .A0 (nx1992), .A1 (nx991)) ;
    xnor2 ix2019 (.Y (nx2018), .A0 (nx2016), .A1 (nx1133)) ;
    xnor2 ix2017 (.Y (nx2016), .A0 (nx1996), .A1 (nx999)) ;
    nand02 ix1134 (.Y (nx1133), .A0 (B[13]), .A1 (A[15])) ;
    mux21_ni ix3549 (.Y (nx3548), .A0 (nx2394), .A1 (nx3544), .S0 (nx2558)) ;
    xnor2 ix2395 (.Y (nx2394), .A0 (nx1139), .A1 (nx2216)) ;
    mux21_ni ix1140 (.Y (nx1139), .A0 (nx1141), .A1 (nx1143), .S0 (nx2226)) ;
    nand02 ix1142 (.Y (nx1141), .A0 (B[12]), .A1 (A[14])) ;
    mux21_ni ix1144 (.Y (nx1143), .A0 (nx1145), .A1 (nx1147), .S0 (nx2236)) ;
    nand02 ix1146 (.Y (nx1145), .A0 (B[12]), .A1 (A[13])) ;
    mux21_ni ix1148 (.Y (nx1147), .A0 (nx1149), .A1 (nx1151), .S0 (nx2246)) ;
    nand02 ix1150 (.Y (nx1149), .A0 (B[12]), .A1 (A[12])) ;
    mux21_ni ix1152 (.Y (nx1151), .A0 (nx1153), .A1 (nx1155), .S0 (nx2256)) ;
    nand02 ix1154 (.Y (nx1153), .A0 (A[11]), .A1 (B[12])) ;
    mux21_ni ix1156 (.Y (nx1155), .A0 (nx1157), .A1 (nx1159), .S0 (nx2266)) ;
    nand02 ix1158 (.Y (nx1157), .A0 (A[10]), .A1 (B[12])) ;
    mux21_ni ix1160 (.Y (nx1159), .A0 (nx1161), .A1 (nx1163), .S0 (nx2276)) ;
    nand02 ix1162 (.Y (nx1161), .A0 (A[9]), .A1 (B[12])) ;
    mux21_ni ix1164 (.Y (nx1163), .A0 (nx1165), .A1 (nx1167), .S0 (nx2286)) ;
    nand02 ix1166 (.Y (nx1165), .A0 (A[8]), .A1 (B[12])) ;
    mux21_ni ix1168 (.Y (nx1167), .A0 (nx1169), .A1 (nx1171), .S0 (nx2296)) ;
    nand02 ix1170 (.Y (nx1169), .A0 (A[7]), .A1 (B[12])) ;
    mux21_ni ix1172 (.Y (nx1171), .A0 (nx1173), .A1 (nx1175), .S0 (nx2306)) ;
    nand02 ix1174 (.Y (nx1173), .A0 (A[6]), .A1 (B[12])) ;
    mux21_ni ix1176 (.Y (nx1175), .A0 (nx1177), .A1 (nx1179), .S0 (nx2316)) ;
    nand02 ix1178 (.Y (nx1177), .A0 (A[5]), .A1 (B[12])) ;
    mux21_ni ix1180 (.Y (nx1179), .A0 (nx1181), .A1 (nx1201), .S0 (nx1203)) ;
    mux21_ni ix1182 (.Y (nx1181), .A0 (nx1183), .A1 (nx1185), .S0 (nx1642)) ;
    nand02 ix1184 (.Y (nx1183), .A0 (A[3]), .A1 (B[12])) ;
    mux21_ni ix1186 (.Y (nx1185), .A0 (nx1187), .A1 (nx1189), .S0 (nx1288)) ;
    nand02 ix1188 (.Y (nx1187), .A0 (A[2]), .A1 (B[12])) ;
    nand03 ix1190 (.Y (nx1189), .A0 (nx3387), .A1 (B[12]), .A2 (B[13])) ;
    xnor2 ix1289 (.Y (nx1288), .A0 (nx1284), .A1 (nx1187)) ;
    nor02ii ix1285 (.Y (nx1284), .A0 (nx1195), .A1 (nx1065)) ;
    aoi22 ix1196 (.Y (nx1195), .A0 (A[1]), .A1 (B[13]), .B0 (A[0]), .B1 (B[14])
          ) ;
    xnor2 ix1643 (.Y (nx1642), .A0 (nx1638), .A1 (nx1183)) ;
    xnor2 ix1639 (.Y (nx1638), .A0 (nx1065), .A1 (nx1636)) ;
    nand02 ix1202 (.Y (nx1201), .A0 (A[4]), .A1 (B[12])) ;
    xnor2 ix1204 (.Y (nx1203), .A0 (nx1205), .A1 (nx1201)) ;
    xnor2 ix1206 (.Y (nx1205), .A0 (nx1061), .A1 (nx1079)) ;
    xnor2 ix2317 (.Y (nx2316), .A0 (nx2314), .A1 (nx1177)) ;
    xnor2 ix2315 (.Y (nx2314), .A0 (nx1059), .A1 (nx2128)) ;
    xnor2 ix2307 (.Y (nx2306), .A0 (nx2304), .A1 (nx1173)) ;
    xnor2 ix2305 (.Y (nx2304), .A0 (nx1055), .A1 (nx2118)) ;
    xnor2 ix2297 (.Y (nx2296), .A0 (nx2294), .A1 (nx1169)) ;
    xnor2 ix2295 (.Y (nx2294), .A0 (nx1051), .A1 (nx2108)) ;
    xnor2 ix2287 (.Y (nx2286), .A0 (nx2284), .A1 (nx1165)) ;
    xnor2 ix2285 (.Y (nx2284), .A0 (nx1047), .A1 (nx2098)) ;
    xnor2 ix2277 (.Y (nx2276), .A0 (nx2274), .A1 (nx1161)) ;
    xnor2 ix2275 (.Y (nx2274), .A0 (nx1043), .A1 (nx2088)) ;
    xnor2 ix2267 (.Y (nx2266), .A0 (nx2264), .A1 (nx1157)) ;
    xnor2 ix2265 (.Y (nx2264), .A0 (nx1039), .A1 (nx2078)) ;
    xnor2 ix2257 (.Y (nx2256), .A0 (nx2254), .A1 (nx1153)) ;
    xnor2 ix2255 (.Y (nx2254), .A0 (nx1035), .A1 (nx2068)) ;
    xnor2 ix2247 (.Y (nx2246), .A0 (nx2244), .A1 (nx1149)) ;
    xnor2 ix2245 (.Y (nx2244), .A0 (nx1031), .A1 (nx2058)) ;
    xnor2 ix2237 (.Y (nx2236), .A0 (nx2234), .A1 (nx1145)) ;
    xnor2 ix2235 (.Y (nx2234), .A0 (nx1027), .A1 (nx2048)) ;
    xnor2 ix2227 (.Y (nx2226), .A0 (nx2224), .A1 (nx1141)) ;
    xnor2 ix2225 (.Y (nx2224), .A0 (nx1023), .A1 (nx2038)) ;
    xnor2 ix2217 (.Y (nx2216), .A0 (nx2214), .A1 (nx1251)) ;
    xnor2 ix2215 (.Y (nx2214), .A0 (nx1019), .A1 (nx2028)) ;
    nand02 ix1252 (.Y (nx1251), .A0 (B[12]), .A1 (A[15])) ;
    mux21_ni ix3545 (.Y (nx3544), .A0 (nx2564), .A1 (nx3540), .S0 (nx2714)) ;
    xnor2 ix2565 (.Y (nx2564), .A0 (nx1257), .A1 (nx2400)) ;
    mux21_ni ix1258 (.Y (nx1257), .A0 (nx1259), .A1 (nx1261), .S0 (nx2410)) ;
    nand02 ix1260 (.Y (nx1259), .A0 (B[11]), .A1 (A[14])) ;
    mux21_ni ix1262 (.Y (nx1261), .A0 (nx1263), .A1 (nx1265), .S0 (nx2420)) ;
    nand02 ix1264 (.Y (nx1263), .A0 (B[11]), .A1 (A[13])) ;
    mux21_ni ix1266 (.Y (nx1265), .A0 (nx1267), .A1 (nx1269), .S0 (nx2430)) ;
    nand02 ix1268 (.Y (nx1267), .A0 (B[11]), .A1 (A[12])) ;
    mux21_ni ix1270 (.Y (nx1269), .A0 (nx1271), .A1 (nx1273), .S0 (nx2440)) ;
    nand02 ix1272 (.Y (nx1271), .A0 (B[11]), .A1 (A[11])) ;
    mux21_ni ix1274 (.Y (nx1273), .A0 (nx1275), .A1 (nx1277), .S0 (nx2450)) ;
    nand02 ix1276 (.Y (nx1275), .A0 (A[10]), .A1 (B[11])) ;
    mux21_ni ix1278 (.Y (nx1277), .A0 (nx1279), .A1 (nx1281), .S0 (nx2460)) ;
    nand02 ix1280 (.Y (nx1279), .A0 (A[9]), .A1 (B[11])) ;
    mux21_ni ix1282 (.Y (nx1281), .A0 (nx1283), .A1 (nx1285), .S0 (nx2470)) ;
    nand02 ix1284 (.Y (nx1283), .A0 (A[8]), .A1 (B[11])) ;
    mux21_ni ix1286 (.Y (nx1285), .A0 (nx1287), .A1 (nx1289), .S0 (nx2480)) ;
    nand02 ix1288 (.Y (nx1287), .A0 (A[7]), .A1 (B[11])) ;
    mux21_ni ix1290 (.Y (nx1289), .A0 (nx1291), .A1 (nx1293), .S0 (nx2490)) ;
    nand02 ix1292 (.Y (nx1291), .A0 (A[6]), .A1 (B[11])) ;
    mux21_ni ix1294 (.Y (nx1293), .A0 (nx1295), .A1 (nx1323), .S0 (nx1325)) ;
    mux21_ni ix1296 (.Y (nx1295), .A0 (nx1297), .A1 (nx1299), .S0 (nx1648)) ;
    nand02 ix1298 (.Y (nx1297), .A0 (A[4]), .A1 (B[11])) ;
    mux21_ni ix1300 (.Y (nx1299), .A0 (nx1301), .A1 (nx1303), .S0 (nx1294)) ;
    nand02 ix1302 (.Y (nx1301), .A0 (A[3]), .A1 (B[11])) ;
    mux21_ni ix1304 (.Y (nx1303), .A0 (nx1305), .A1 (nx1307), .S0 (nx970)) ;
    nand02 ix1306 (.Y (nx1305), .A0 (A[2]), .A1 (B[11])) ;
    nand03 ix1308 (.Y (nx1307), .A0 (nx3387), .A1 (B[11]), .A2 (B[12])) ;
    xnor2 ix971 (.Y (nx970), .A0 (nx966), .A1 (nx1305)) ;
    nor02ii ix967 (.Y (nx966), .A0 (nx1313), .A1 (nx1189)) ;
    aoi22 ix1314 (.Y (nx1313), .A0 (A[1]), .A1 (B[12]), .B0 (A[0]), .B1 (B[13])
          ) ;
    xnor2 ix1295 (.Y (nx1294), .A0 (nx1290), .A1 (nx1301)) ;
    xnor2 ix1291 (.Y (nx1290), .A0 (nx1189), .A1 (nx1288)) ;
    xnor2 ix1649 (.Y (nx1648), .A0 (nx1644), .A1 (nx1297)) ;
    xnor2 ix1645 (.Y (nx1644), .A0 (nx1185), .A1 (nx1642)) ;
    nand02 ix1324 (.Y (nx1323), .A0 (A[5]), .A1 (B[11])) ;
    xnor2 ix1326 (.Y (nx1325), .A0 (nx1327), .A1 (nx1323)) ;
    xnor2 ix1328 (.Y (nx1327), .A0 (nx1181), .A1 (nx1203)) ;
    xnor2 ix2491 (.Y (nx2490), .A0 (nx2488), .A1 (nx1291)) ;
    xnor2 ix2489 (.Y (nx2488), .A0 (nx1179), .A1 (nx2316)) ;
    xnor2 ix2481 (.Y (nx2480), .A0 (nx2478), .A1 (nx1287)) ;
    xnor2 ix2479 (.Y (nx2478), .A0 (nx1175), .A1 (nx2306)) ;
    xnor2 ix2471 (.Y (nx2470), .A0 (nx2468), .A1 (nx1283)) ;
    xnor2 ix2469 (.Y (nx2468), .A0 (nx1171), .A1 (nx2296)) ;
    xnor2 ix2461 (.Y (nx2460), .A0 (nx2458), .A1 (nx1279)) ;
    xnor2 ix2459 (.Y (nx2458), .A0 (nx1167), .A1 (nx2286)) ;
    xnor2 ix2451 (.Y (nx2450), .A0 (nx2448), .A1 (nx1275)) ;
    xnor2 ix2449 (.Y (nx2448), .A0 (nx1163), .A1 (nx2276)) ;
    xnor2 ix2441 (.Y (nx2440), .A0 (nx2438), .A1 (nx1271)) ;
    xnor2 ix2439 (.Y (nx2438), .A0 (nx1159), .A1 (nx2266)) ;
    xnor2 ix2431 (.Y (nx2430), .A0 (nx2428), .A1 (nx1267)) ;
    xnor2 ix2429 (.Y (nx2428), .A0 (nx1155), .A1 (nx2256)) ;
    xnor2 ix2421 (.Y (nx2420), .A0 (nx2418), .A1 (nx1263)) ;
    xnor2 ix2419 (.Y (nx2418), .A0 (nx1151), .A1 (nx2246)) ;
    xnor2 ix2411 (.Y (nx2410), .A0 (nx2408), .A1 (nx1259)) ;
    xnor2 ix2409 (.Y (nx2408), .A0 (nx1147), .A1 (nx2236)) ;
    xnor2 ix2401 (.Y (nx2400), .A0 (nx2398), .A1 (nx1369)) ;
    xnor2 ix2399 (.Y (nx2398), .A0 (nx1143), .A1 (nx2226)) ;
    nand02 ix1370 (.Y (nx1369), .A0 (B[11]), .A1 (A[15])) ;
    mux21_ni ix3541 (.Y (nx3540), .A0 (nx2720), .A1 (nx3536), .S0 (nx2856)) ;
    xnor2 ix2721 (.Y (nx2720), .A0 (nx1375), .A1 (nx2570)) ;
    mux21_ni ix1376 (.Y (nx1375), .A0 (nx1377), .A1 (nx1379), .S0 (nx2580)) ;
    nand02 ix1378 (.Y (nx1377), .A0 (B[10]), .A1 (A[14])) ;
    mux21_ni ix1380 (.Y (nx1379), .A0 (nx1381), .A1 (nx1383), .S0 (nx2590)) ;
    nand02 ix1382 (.Y (nx1381), .A0 (B[10]), .A1 (A[13])) ;
    mux21_ni ix1384 (.Y (nx1383), .A0 (nx1385), .A1 (nx1387), .S0 (nx2600)) ;
    nand02 ix1386 (.Y (nx1385), .A0 (B[10]), .A1 (A[12])) ;
    mux21_ni ix1388 (.Y (nx1387), .A0 (nx1389), .A1 (nx1391), .S0 (nx2610)) ;
    nand02 ix1390 (.Y (nx1389), .A0 (B[10]), .A1 (A[11])) ;
    mux21_ni ix1392 (.Y (nx1391), .A0 (nx1393), .A1 (nx1395), .S0 (nx2620)) ;
    nand02 ix1394 (.Y (nx1393), .A0 (B[10]), .A1 (A[10])) ;
    mux21_ni ix1396 (.Y (nx1395), .A0 (nx1397), .A1 (nx1399), .S0 (nx2630)) ;
    nand02 ix1398 (.Y (nx1397), .A0 (A[9]), .A1 (B[10])) ;
    mux21_ni ix1400 (.Y (nx1399), .A0 (nx1401), .A1 (nx1403), .S0 (nx2640)) ;
    nand02 ix1402 (.Y (nx1401), .A0 (A[8]), .A1 (B[10])) ;
    mux21_ni ix1404 (.Y (nx1403), .A0 (nx1405), .A1 (nx1407), .S0 (nx2650)) ;
    nand02 ix1406 (.Y (nx1405), .A0 (A[7]), .A1 (B[10])) ;
    mux21_ni ix1408 (.Y (nx1407), .A0 (nx1409), .A1 (nx1445), .S0 (nx1447)) ;
    mux21_ni ix1410 (.Y (nx1409), .A0 (nx1411), .A1 (nx1413), .S0 (nx1654)) ;
    nand02 ix1412 (.Y (nx1411), .A0 (A[5]), .A1 (B[10])) ;
    mux21_ni ix1414 (.Y (nx1413), .A0 (nx1415), .A1 (nx1417), .S0 (nx1300)) ;
    nand02 ix1416 (.Y (nx1415), .A0 (A[4]), .A1 (B[10])) ;
    mux21_ni ix1418 (.Y (nx1417), .A0 (nx1419), .A1 (nx1421), .S0 (nx976)) ;
    nand02 ix1420 (.Y (nx1419), .A0 (A[3]), .A1 (B[10])) ;
    mux21_ni ix1422 (.Y (nx1421), .A0 (nx1423), .A1 (nx1425), .S0 (nx710)) ;
    nand02 ix1424 (.Y (nx1423), .A0 (A[2]), .A1 (B[10])) ;
    nand03 ix1426 (.Y (nx1425), .A0 (nx3387), .A1 (B[10]), .A2 (B[11])) ;
    xnor2 ix711 (.Y (nx710), .A0 (nx706), .A1 (nx1423)) ;
    nor02ii ix707 (.Y (nx706), .A0 (nx1431), .A1 (nx1307)) ;
    aoi22 ix1432 (.Y (nx1431), .A0 (A[1]), .A1 (B[11]), .B0 (A[0]), .B1 (B[12])
          ) ;
    xnor2 ix977 (.Y (nx976), .A0 (nx972), .A1 (nx1419)) ;
    xnor2 ix973 (.Y (nx972), .A0 (nx1307), .A1 (nx970)) ;
    xnor2 ix1301 (.Y (nx1300), .A0 (nx1296), .A1 (nx1415)) ;
    xnor2 ix1297 (.Y (nx1296), .A0 (nx1303), .A1 (nx1294)) ;
    xnor2 ix1655 (.Y (nx1654), .A0 (nx1650), .A1 (nx1411)) ;
    xnor2 ix1651 (.Y (nx1650), .A0 (nx1299), .A1 (nx1648)) ;
    nand02 ix1446 (.Y (nx1445), .A0 (A[6]), .A1 (B[10])) ;
    xnor2 ix1448 (.Y (nx1447), .A0 (nx1449), .A1 (nx1445)) ;
    xnor2 ix1450 (.Y (nx1449), .A0 (nx1295), .A1 (nx1325)) ;
    xnor2 ix2651 (.Y (nx2650), .A0 (nx2648), .A1 (nx1405)) ;
    xnor2 ix2649 (.Y (nx2648), .A0 (nx1293), .A1 (nx2490)) ;
    xnor2 ix2641 (.Y (nx2640), .A0 (nx2638), .A1 (nx1401)) ;
    xnor2 ix2639 (.Y (nx2638), .A0 (nx1289), .A1 (nx2480)) ;
    xnor2 ix2631 (.Y (nx2630), .A0 (nx2628), .A1 (nx1397)) ;
    xnor2 ix2629 (.Y (nx2628), .A0 (nx1285), .A1 (nx2470)) ;
    xnor2 ix2621 (.Y (nx2620), .A0 (nx2618), .A1 (nx1393)) ;
    xnor2 ix2619 (.Y (nx2618), .A0 (nx1281), .A1 (nx2460)) ;
    xnor2 ix2611 (.Y (nx2610), .A0 (nx2608), .A1 (nx1389)) ;
    xnor2 ix2609 (.Y (nx2608), .A0 (nx1277), .A1 (nx2450)) ;
    xnor2 ix2601 (.Y (nx2600), .A0 (nx2598), .A1 (nx1385)) ;
    xnor2 ix2599 (.Y (nx2598), .A0 (nx1273), .A1 (nx2440)) ;
    xnor2 ix2591 (.Y (nx2590), .A0 (nx2588), .A1 (nx1381)) ;
    xnor2 ix2589 (.Y (nx2588), .A0 (nx1269), .A1 (nx2430)) ;
    xnor2 ix2581 (.Y (nx2580), .A0 (nx2578), .A1 (nx1377)) ;
    xnor2 ix2579 (.Y (nx2578), .A0 (nx1265), .A1 (nx2420)) ;
    xnor2 ix2571 (.Y (nx2570), .A0 (nx2568), .A1 (nx1487)) ;
    xnor2 ix2569 (.Y (nx2568), .A0 (nx1261), .A1 (nx2410)) ;
    nand02 ix1488 (.Y (nx1487), .A0 (B[10]), .A1 (A[15])) ;
    mux21_ni ix3537 (.Y (nx3536), .A0 (nx2862), .A1 (nx3532), .S0 (nx2984)) ;
    xnor2 ix2863 (.Y (nx2862), .A0 (nx1493), .A1 (nx2726)) ;
    mux21_ni ix1494 (.Y (nx1493), .A0 (nx1495), .A1 (nx1497), .S0 (nx2736)) ;
    nand02 ix1496 (.Y (nx1495), .A0 (B[9]), .A1 (A[14])) ;
    mux21_ni ix1498 (.Y (nx1497), .A0 (nx1499), .A1 (nx1501), .S0 (nx2746)) ;
    nand02 ix1500 (.Y (nx1499), .A0 (B[9]), .A1 (A[13])) ;
    mux21_ni ix1502 (.Y (nx1501), .A0 (nx1503), .A1 (nx1505), .S0 (nx2756)) ;
    nand02 ix1504 (.Y (nx1503), .A0 (B[9]), .A1 (A[12])) ;
    mux21_ni ix1506 (.Y (nx1505), .A0 (nx1507), .A1 (nx1509), .S0 (nx2766)) ;
    nand02 ix1508 (.Y (nx1507), .A0 (B[9]), .A1 (A[11])) ;
    mux21_ni ix1510 (.Y (nx1509), .A0 (nx1511), .A1 (nx1513), .S0 (nx2776)) ;
    nand02 ix1512 (.Y (nx1511), .A0 (B[9]), .A1 (A[10])) ;
    mux21_ni ix1514 (.Y (nx1513), .A0 (nx1515), .A1 (nx1517), .S0 (nx2786)) ;
    nand02 ix1516 (.Y (nx1515), .A0 (B[9]), .A1 (A[9])) ;
    mux21_ni ix1518 (.Y (nx1517), .A0 (nx1519), .A1 (nx1521), .S0 (nx2796)) ;
    nand02 ix1520 (.Y (nx1519), .A0 (A[8]), .A1 (B[9])) ;
    mux21_ni ix1522 (.Y (nx1521), .A0 (nx1523), .A1 (nx1567), .S0 (nx1569)) ;
    mux21_ni ix1524 (.Y (nx1523), .A0 (nx1525), .A1 (nx1527), .S0 (nx1660)) ;
    nand02 ix1526 (.Y (nx1525), .A0 (A[6]), .A1 (B[9])) ;
    mux21_ni ix1528 (.Y (nx1527), .A0 (nx1529), .A1 (nx1531), .S0 (nx1306)) ;
    nand02 ix1530 (.Y (nx1529), .A0 (A[5]), .A1 (B[9])) ;
    mux21_ni ix1532 (.Y (nx1531), .A0 (nx1533), .A1 (nx1535), .S0 (nx982)) ;
    nand02 ix1534 (.Y (nx1533), .A0 (A[4]), .A1 (B[9])) ;
    mux21_ni ix1536 (.Y (nx1535), .A0 (nx1537), .A1 (nx1539), .S0 (nx716)) ;
    nand02 ix1538 (.Y (nx1537), .A0 (A[3]), .A1 (B[9])) ;
    mux21_ni ix1540 (.Y (nx1539), .A0 (nx1541), .A1 (nx1543), .S0 (nx506)) ;
    nand02 ix1542 (.Y (nx1541), .A0 (A[2]), .A1 (B[9])) ;
    nand03 ix1544 (.Y (nx1543), .A0 (nx3387), .A1 (B[9]), .A2 (B[10])) ;
    xnor2 ix507 (.Y (nx506), .A0 (nx502), .A1 (nx1541)) ;
    nor02ii ix503 (.Y (nx502), .A0 (nx1549), .A1 (nx1425)) ;
    aoi22 ix1550 (.Y (nx1549), .A0 (A[1]), .A1 (B[10]), .B0 (A[0]), .B1 (B[11])
          ) ;
    xnor2 ix717 (.Y (nx716), .A0 (nx712), .A1 (nx1537)) ;
    xnor2 ix713 (.Y (nx712), .A0 (nx1425), .A1 (nx710)) ;
    xnor2 ix983 (.Y (nx982), .A0 (nx978), .A1 (nx1533)) ;
    xnor2 ix979 (.Y (nx978), .A0 (nx1421), .A1 (nx976)) ;
    xnor2 ix1307 (.Y (nx1306), .A0 (nx1302), .A1 (nx1529)) ;
    xnor2 ix1303 (.Y (nx1302), .A0 (nx1417), .A1 (nx1300)) ;
    xnor2 ix1661 (.Y (nx1660), .A0 (nx1656), .A1 (nx1525)) ;
    xnor2 ix1657 (.Y (nx1656), .A0 (nx1413), .A1 (nx1654)) ;
    nand02 ix1568 (.Y (nx1567), .A0 (A[7]), .A1 (B[9])) ;
    xnor2 ix1570 (.Y (nx1569), .A0 (nx1571), .A1 (nx1567)) ;
    xnor2 ix1572 (.Y (nx1571), .A0 (nx1409), .A1 (nx1447)) ;
    xnor2 ix2797 (.Y (nx2796), .A0 (nx2794), .A1 (nx1519)) ;
    xnor2 ix2795 (.Y (nx2794), .A0 (nx1407), .A1 (nx2650)) ;
    xnor2 ix2787 (.Y (nx2786), .A0 (nx2784), .A1 (nx1515)) ;
    xnor2 ix2785 (.Y (nx2784), .A0 (nx1403), .A1 (nx2640)) ;
    xnor2 ix2777 (.Y (nx2776), .A0 (nx2774), .A1 (nx1511)) ;
    xnor2 ix2775 (.Y (nx2774), .A0 (nx1399), .A1 (nx2630)) ;
    xnor2 ix2767 (.Y (nx2766), .A0 (nx2764), .A1 (nx1507)) ;
    xnor2 ix2765 (.Y (nx2764), .A0 (nx1395), .A1 (nx2620)) ;
    xnor2 ix2757 (.Y (nx2756), .A0 (nx2754), .A1 (nx1503)) ;
    xnor2 ix2755 (.Y (nx2754), .A0 (nx1391), .A1 (nx2610)) ;
    xnor2 ix2747 (.Y (nx2746), .A0 (nx2744), .A1 (nx1499)) ;
    xnor2 ix2745 (.Y (nx2744), .A0 (nx1387), .A1 (nx2600)) ;
    xnor2 ix2737 (.Y (nx2736), .A0 (nx2734), .A1 (nx1495)) ;
    xnor2 ix2735 (.Y (nx2734), .A0 (nx1383), .A1 (nx2590)) ;
    xnor2 ix2727 (.Y (nx2726), .A0 (nx2724), .A1 (nx1605)) ;
    xnor2 ix2725 (.Y (nx2724), .A0 (nx1379), .A1 (nx2580)) ;
    nand02 ix1606 (.Y (nx1605), .A0 (B[9]), .A1 (A[15])) ;
    mux21_ni ix3533 (.Y (nx3532), .A0 (nx2990), .A1 (nx3528), .S0 (nx3098)) ;
    xnor2 ix2991 (.Y (nx2990), .A0 (nx1611), .A1 (nx2868)) ;
    mux21_ni ix1612 (.Y (nx1611), .A0 (nx1613), .A1 (nx1615), .S0 (nx2878)) ;
    nand02 ix1614 (.Y (nx1613), .A0 (B[8]), .A1 (A[14])) ;
    mux21_ni ix1616 (.Y (nx1615), .A0 (nx1617), .A1 (nx1619), .S0 (nx2888)) ;
    nand02 ix1618 (.Y (nx1617), .A0 (B[8]), .A1 (A[13])) ;
    mux21_ni ix1620 (.Y (nx1619), .A0 (nx1621), .A1 (nx1623), .S0 (nx2898)) ;
    nand02 ix1622 (.Y (nx1621), .A0 (B[8]), .A1 (A[12])) ;
    mux21_ni ix1624 (.Y (nx1623), .A0 (nx1625), .A1 (nx1627), .S0 (nx2908)) ;
    nand02 ix1626 (.Y (nx1625), .A0 (B[8]), .A1 (A[11])) ;
    mux21_ni ix1628 (.Y (nx1627), .A0 (nx1629), .A1 (nx1631), .S0 (nx2918)) ;
    nand02 ix1630 (.Y (nx1629), .A0 (B[8]), .A1 (A[10])) ;
    mux21_ni ix1632 (.Y (nx1631), .A0 (nx1633), .A1 (nx1635), .S0 (nx2928)) ;
    nand02 ix1634 (.Y (nx1633), .A0 (B[8]), .A1 (A[9])) ;
    mux21_ni ix1636 (.Y (nx1635), .A0 (nx1637), .A1 (nx1689), .S0 (nx1691)) ;
    mux21_ni ix1638 (.Y (nx1637), .A0 (nx1639), .A1 (nx1641), .S0 (nx1666)) ;
    nand02 ix1640 (.Y (nx1639), .A0 (A[7]), .A1 (B[8])) ;
    mux21_ni ix1642 (.Y (nx1641), .A0 (nx1643), .A1 (nx1645), .S0 (nx1312)) ;
    nand02 ix1644 (.Y (nx1643), .A0 (A[6]), .A1 (B[8])) ;
    mux21_ni ix1646 (.Y (nx1645), .A0 (nx1647), .A1 (nx1649), .S0 (nx988)) ;
    nand02 ix1648 (.Y (nx1647), .A0 (A[5]), .A1 (B[8])) ;
    mux21_ni ix1650 (.Y (nx1649), .A0 (nx1651), .A1 (nx1653), .S0 (nx722)) ;
    nand02 ix1652 (.Y (nx1651), .A0 (A[4]), .A1 (B[8])) ;
    mux21_ni ix1654 (.Y (nx1653), .A0 (nx1655), .A1 (nx1657), .S0 (nx512)) ;
    nand02 ix1656 (.Y (nx1655), .A0 (A[3]), .A1 (B[8])) ;
    mux21_ni ix1658 (.Y (nx1657), .A0 (nx1659), .A1 (nx1661), .S0 (nx358)) ;
    nand02 ix1660 (.Y (nx1659), .A0 (A[2]), .A1 (B[8])) ;
    nand03 ix1662 (.Y (nx1661), .A0 (nx3387), .A1 (B[8]), .A2 (B[9])) ;
    xnor2 ix359 (.Y (nx358), .A0 (nx354), .A1 (nx1659)) ;
    nor02ii ix355 (.Y (nx354), .A0 (nx1667), .A1 (nx1543)) ;
    aoi22 ix1668 (.Y (nx1667), .A0 (A[1]), .A1 (B[9]), .B0 (A[0]), .B1 (B[10])
          ) ;
    xnor2 ix513 (.Y (nx512), .A0 (nx508), .A1 (nx1655)) ;
    xnor2 ix509 (.Y (nx508), .A0 (nx1543), .A1 (nx506)) ;
    xnor2 ix723 (.Y (nx722), .A0 (nx718), .A1 (nx1651)) ;
    xnor2 ix719 (.Y (nx718), .A0 (nx1539), .A1 (nx716)) ;
    xnor2 ix989 (.Y (nx988), .A0 (nx984), .A1 (nx1647)) ;
    xnor2 ix985 (.Y (nx984), .A0 (nx1535), .A1 (nx982)) ;
    xnor2 ix1313 (.Y (nx1312), .A0 (nx1308), .A1 (nx1643)) ;
    xnor2 ix1309 (.Y (nx1308), .A0 (nx1531), .A1 (nx1306)) ;
    xnor2 ix1667 (.Y (nx1666), .A0 (nx1662), .A1 (nx1639)) ;
    xnor2 ix1663 (.Y (nx1662), .A0 (nx1527), .A1 (nx1660)) ;
    nand02 ix1690 (.Y (nx1689), .A0 (B[8]), .A1 (A[8])) ;
    xnor2 ix1692 (.Y (nx1691), .A0 (nx1693), .A1 (nx1689)) ;
    xnor2 ix1694 (.Y (nx1693), .A0 (nx1523), .A1 (nx1569)) ;
    xnor2 ix2929 (.Y (nx2928), .A0 (nx2926), .A1 (nx1633)) ;
    xnor2 ix2927 (.Y (nx2926), .A0 (nx1521), .A1 (nx2796)) ;
    xnor2 ix2919 (.Y (nx2918), .A0 (nx2916), .A1 (nx1629)) ;
    xnor2 ix2917 (.Y (nx2916), .A0 (nx1517), .A1 (nx2786)) ;
    xnor2 ix2909 (.Y (nx2908), .A0 (nx2906), .A1 (nx1625)) ;
    xnor2 ix2907 (.Y (nx2906), .A0 (nx1513), .A1 (nx2776)) ;
    xnor2 ix2899 (.Y (nx2898), .A0 (nx2896), .A1 (nx1621)) ;
    xnor2 ix2897 (.Y (nx2896), .A0 (nx1509), .A1 (nx2766)) ;
    xnor2 ix2889 (.Y (nx2888), .A0 (nx2886), .A1 (nx1617)) ;
    xnor2 ix2887 (.Y (nx2886), .A0 (nx1505), .A1 (nx2756)) ;
    xnor2 ix2879 (.Y (nx2878), .A0 (nx2876), .A1 (nx1613)) ;
    xnor2 ix2877 (.Y (nx2876), .A0 (nx1501), .A1 (nx2746)) ;
    xnor2 ix2869 (.Y (nx2868), .A0 (nx2866), .A1 (nx1723)) ;
    xnor2 ix2867 (.Y (nx2866), .A0 (nx1497), .A1 (nx2736)) ;
    nand02 ix1724 (.Y (nx1723), .A0 (B[8]), .A1 (A[15])) ;
    mux21_ni ix3529 (.Y (nx3528), .A0 (nx3104), .A1 (nx3524), .S0 (nx3198)) ;
    xnor2 ix3105 (.Y (nx3104), .A0 (nx1727), .A1 (nx2996)) ;
    mux21_ni ix1728 (.Y (nx1727), .A0 (nx1729), .A1 (nx1731), .S0 (nx3006)) ;
    nand02 ix1730 (.Y (nx1729), .A0 (B[7]), .A1 (A[14])) ;
    mux21_ni ix1732 (.Y (nx1731), .A0 (nx1733), .A1 (nx1735), .S0 (nx3016)) ;
    nand02 ix1734 (.Y (nx1733), .A0 (B[7]), .A1 (A[13])) ;
    mux21_ni ix1736 (.Y (nx1735), .A0 (nx1737), .A1 (nx1739), .S0 (nx3026)) ;
    nand02 ix1738 (.Y (nx1737), .A0 (B[7]), .A1 (A[12])) ;
    mux21_ni ix1740 (.Y (nx1739), .A0 (nx1741), .A1 (nx1743), .S0 (nx3036)) ;
    nand02 ix1742 (.Y (nx1741), .A0 (B[7]), .A1 (A[11])) ;
    mux21_ni ix1744 (.Y (nx1743), .A0 (nx1745), .A1 (nx1747), .S0 (nx3046)) ;
    nand02 ix1746 (.Y (nx1745), .A0 (B[7]), .A1 (A[10])) ;
    mux21_ni ix1748 (.Y (nx1747), .A0 (nx1749), .A1 (nx1803), .S0 (nx1805)) ;
    mux21_ni ix1750 (.Y (nx1749), .A0 (nx1751), .A1 (nx1753), .S0 (nx1672)) ;
    nand02 ix1752 (.Y (nx1751), .A0 (B[7]), .A1 (A[8])) ;
    mux21_ni ix1754 (.Y (nx1753), .A0 (nx1755), .A1 (nx1757), .S0 (nx1318)) ;
    nand02 ix1756 (.Y (nx1755), .A0 (B[7]), .A1 (A[7])) ;
    mux21_ni ix1758 (.Y (nx1757), .A0 (nx1759), .A1 (nx1761), .S0 (nx994)) ;
    nand02 ix1760 (.Y (nx1759), .A0 (A[6]), .A1 (B[7])) ;
    mux21_ni ix1762 (.Y (nx1761), .A0 (nx1763), .A1 (nx1765), .S0 (nx728)) ;
    nand02 ix1764 (.Y (nx1763), .A0 (A[5]), .A1 (B[7])) ;
    mux21_ni ix1766 (.Y (nx1765), .A0 (nx1767), .A1 (nx1769), .S0 (nx518)) ;
    nand02 ix1768 (.Y (nx1767), .A0 (A[4]), .A1 (B[7])) ;
    mux21_ni ix1770 (.Y (nx1769), .A0 (nx1771), .A1 (nx1773), .S0 (nx364)) ;
    nand02 ix1772 (.Y (nx1771), .A0 (A[3]), .A1 (B[7])) ;
    mux21_ni ix1774 (.Y (nx1773), .A0 (nx1775), .A1 (nx1777), .S0 (nx266)) ;
    nand02 ix1776 (.Y (nx1775), .A0 (A[2]), .A1 (B[7])) ;
    nand03 ix1778 (.Y (nx1777), .A0 (nx3387), .A1 (B[7]), .A2 (B[8])) ;
    xnor2 ix267 (.Y (nx266), .A0 (nx262), .A1 (nx1775)) ;
    nor02ii ix263 (.Y (nx262), .A0 (nx1781), .A1 (nx1661)) ;
    aoi22 ix1782 (.Y (nx1781), .A0 (A[1]), .A1 (B[8]), .B0 (A[0]), .B1 (B[9])) ;
    xnor2 ix365 (.Y (nx364), .A0 (nx360), .A1 (nx1771)) ;
    xnor2 ix361 (.Y (nx360), .A0 (nx1661), .A1 (nx358)) ;
    xnor2 ix519 (.Y (nx518), .A0 (nx514), .A1 (nx1767)) ;
    xnor2 ix515 (.Y (nx514), .A0 (nx1657), .A1 (nx512)) ;
    xnor2 ix729 (.Y (nx728), .A0 (nx724), .A1 (nx1763)) ;
    xnor2 ix725 (.Y (nx724), .A0 (nx1653), .A1 (nx722)) ;
    xnor2 ix995 (.Y (nx994), .A0 (nx990), .A1 (nx1759)) ;
    xnor2 ix991 (.Y (nx990), .A0 (nx1649), .A1 (nx988)) ;
    xnor2 ix1319 (.Y (nx1318), .A0 (nx1314), .A1 (nx1755)) ;
    xnor2 ix1315 (.Y (nx1314), .A0 (nx1645), .A1 (nx1312)) ;
    xnor2 ix1673 (.Y (nx1672), .A0 (nx1668), .A1 (nx1751)) ;
    xnor2 ix1669 (.Y (nx1668), .A0 (nx1641), .A1 (nx1666)) ;
    nand02 ix1804 (.Y (nx1803), .A0 (B[7]), .A1 (A[9])) ;
    xnor2 ix1806 (.Y (nx1805), .A0 (nx1807), .A1 (nx1803)) ;
    xnor2 ix1808 (.Y (nx1807), .A0 (nx1637), .A1 (nx1691)) ;
    xnor2 ix3047 (.Y (nx3046), .A0 (nx3044), .A1 (nx1745)) ;
    xnor2 ix3045 (.Y (nx3044), .A0 (nx1635), .A1 (nx2928)) ;
    xnor2 ix3037 (.Y (nx3036), .A0 (nx3034), .A1 (nx1741)) ;
    xnor2 ix3035 (.Y (nx3034), .A0 (nx1631), .A1 (nx2918)) ;
    xnor2 ix3027 (.Y (nx3026), .A0 (nx3024), .A1 (nx1737)) ;
    xnor2 ix3025 (.Y (nx3024), .A0 (nx1627), .A1 (nx2908)) ;
    xnor2 ix3017 (.Y (nx3016), .A0 (nx3014), .A1 (nx1733)) ;
    xnor2 ix3015 (.Y (nx3014), .A0 (nx1623), .A1 (nx2898)) ;
    xnor2 ix3007 (.Y (nx3006), .A0 (nx3004), .A1 (nx1729)) ;
    xnor2 ix3005 (.Y (nx3004), .A0 (nx1619), .A1 (nx2888)) ;
    xnor2 ix2997 (.Y (nx2996), .A0 (nx2994), .A1 (nx1833)) ;
    xnor2 ix2995 (.Y (nx2994), .A0 (nx1615), .A1 (nx2878)) ;
    nand02 ix1834 (.Y (nx1833), .A0 (B[7]), .A1 (A[15])) ;
    mux21_ni ix3525 (.Y (nx3524), .A0 (nx3204), .A1 (nx3520), .S0 (nx3284)) ;
    xnor2 ix3205 (.Y (nx3204), .A0 (nx1839), .A1 (nx3110)) ;
    mux21_ni ix1840 (.Y (nx1839), .A0 (nx1841), .A1 (nx1843), .S0 (nx3120)) ;
    nand02 ix1842 (.Y (nx1841), .A0 (B[6]), .A1 (A[14])) ;
    mux21_ni ix1844 (.Y (nx1843), .A0 (nx1845), .A1 (nx1847), .S0 (nx3130)) ;
    nand02 ix1846 (.Y (nx1845), .A0 (B[6]), .A1 (A[13])) ;
    mux21_ni ix1848 (.Y (nx1847), .A0 (nx1849), .A1 (nx1851), .S0 (nx3140)) ;
    nand02 ix1850 (.Y (nx1849), .A0 (B[6]), .A1 (A[12])) ;
    mux21_ni ix1852 (.Y (nx1851), .A0 (nx1853), .A1 (nx1855), .S0 (nx3150)) ;
    nand02 ix1854 (.Y (nx1853), .A0 (B[6]), .A1 (A[11])) ;
    mux21_ni ix1856 (.Y (nx1855), .A0 (nx1857), .A1 (nx1925), .S0 (nx1927)) ;
    mux21_ni ix1858 (.Y (nx1857), .A0 (nx1859), .A1 (nx1861), .S0 (nx1678)) ;
    nand02 ix1860 (.Y (nx1859), .A0 (B[6]), .A1 (A[9])) ;
    mux21_ni ix1862 (.Y (nx1861), .A0 (nx1863), .A1 (nx1865), .S0 (nx1324)) ;
    nand02 ix1864 (.Y (nx1863), .A0 (B[6]), .A1 (A[8])) ;
    mux21_ni ix1866 (.Y (nx1865), .A0 (nx1867), .A1 (nx1869), .S0 (nx1000)) ;
    nand02 ix1868 (.Y (nx1867), .A0 (B[6]), .A1 (A[7])) ;
    mux21_ni ix1870 (.Y (nx1869), .A0 (nx1871), .A1 (nx1873), .S0 (nx734)) ;
    nand02 ix1872 (.Y (nx1871), .A0 (B[6]), .A1 (A[6])) ;
    mux21_ni ix1874 (.Y (nx1873), .A0 (nx1875), .A1 (nx1877), .S0 (nx524)) ;
    nand02 ix1876 (.Y (nx1875), .A0 (A[5]), .A1 (B[6])) ;
    mux21_ni ix1878 (.Y (nx1877), .A0 (nx1879), .A1 (nx1881), .S0 (nx370)) ;
    nand02 ix1880 (.Y (nx1879), .A0 (A[4]), .A1 (B[6])) ;
    mux21_ni ix1882 (.Y (nx1881), .A0 (nx1883), .A1 (nx1885), .S0 (nx272)) ;
    nand02 ix1884 (.Y (nx1883), .A0 (A[3]), .A1 (B[6])) ;
    mux21_ni ix1886 (.Y (nx1885), .A0 (nx1887), .A1 (nx1889), .S0 (nx236)) ;
    nand02 ix1888 (.Y (nx1887), .A0 (A[2]), .A1 (B[6])) ;
    nand03 ix1890 (.Y (nx1889), .A0 (nx220), .A1 (B[6]), .A2 (B[7])) ;
    xnor2 ix237 (.Y (nx236), .A0 (nx234), .A1 (nx1887)) ;
    nor02ii ix235 (.Y (nx234), .A0 (nx1895), .A1 (nx1777)) ;
    aoi22 ix1896 (.Y (nx1895), .A0 (A[1]), .A1 (B[7]), .B0 (A[0]), .B1 (B[8])) ;
    xnor2 ix273 (.Y (nx272), .A0 (nx268), .A1 (nx1883)) ;
    xnor2 ix269 (.Y (nx268), .A0 (nx1777), .A1 (nx266)) ;
    xnor2 ix371 (.Y (nx370), .A0 (nx366), .A1 (nx1879)) ;
    xnor2 ix367 (.Y (nx366), .A0 (nx1773), .A1 (nx364)) ;
    xnor2 ix525 (.Y (nx524), .A0 (nx520), .A1 (nx1875)) ;
    xnor2 ix521 (.Y (nx520), .A0 (nx1769), .A1 (nx518)) ;
    xnor2 ix735 (.Y (nx734), .A0 (nx730), .A1 (nx1871)) ;
    xnor2 ix731 (.Y (nx730), .A0 (nx1765), .A1 (nx728)) ;
    xnor2 ix1001 (.Y (nx1000), .A0 (nx996), .A1 (nx1867)) ;
    xnor2 ix997 (.Y (nx996), .A0 (nx1761), .A1 (nx994)) ;
    xnor2 ix1325 (.Y (nx1324), .A0 (nx1320), .A1 (nx1863)) ;
    xnor2 ix1321 (.Y (nx1320), .A0 (nx1757), .A1 (nx1318)) ;
    xnor2 ix1679 (.Y (nx1678), .A0 (nx1674), .A1 (nx1859)) ;
    xnor2 ix1675 (.Y (nx1674), .A0 (nx1753), .A1 (nx1672)) ;
    nand02 ix1926 (.Y (nx1925), .A0 (B[6]), .A1 (A[10])) ;
    xnor2 ix1928 (.Y (nx1927), .A0 (nx1929), .A1 (nx1925)) ;
    xnor2 ix1930 (.Y (nx1929), .A0 (nx1749), .A1 (nx1805)) ;
    xnor2 ix3151 (.Y (nx3150), .A0 (nx3148), .A1 (nx1853)) ;
    xnor2 ix3149 (.Y (nx3148), .A0 (nx1747), .A1 (nx3046)) ;
    xnor2 ix3141 (.Y (nx3140), .A0 (nx3138), .A1 (nx1849)) ;
    xnor2 ix3139 (.Y (nx3138), .A0 (nx1743), .A1 (nx3036)) ;
    xnor2 ix3131 (.Y (nx3130), .A0 (nx3128), .A1 (nx1845)) ;
    xnor2 ix3129 (.Y (nx3128), .A0 (nx1739), .A1 (nx3026)) ;
    xnor2 ix3121 (.Y (nx3120), .A0 (nx3118), .A1 (nx1841)) ;
    xnor2 ix3119 (.Y (nx3118), .A0 (nx1735), .A1 (nx3016)) ;
    xnor2 ix3111 (.Y (nx3110), .A0 (nx3108), .A1 (nx1951)) ;
    xnor2 ix3109 (.Y (nx3108), .A0 (nx1731), .A1 (nx3006)) ;
    nand02 ix1952 (.Y (nx1951), .A0 (B[6]), .A1 (A[15])) ;
    mux21_ni ix3521 (.Y (nx3520), .A0 (nx3290), .A1 (nx3516), .S0 (nx3356)) ;
    xnor2 ix3291 (.Y (nx3290), .A0 (nx1957), .A1 (nx3210)) ;
    mux21_ni ix1958 (.Y (nx1957), .A0 (nx1959), .A1 (nx1961), .S0 (nx3220)) ;
    nand02 ix1960 (.Y (nx1959), .A0 (B[5]), .A1 (A[14])) ;
    mux21_ni ix1962 (.Y (nx1961), .A0 (nx1963), .A1 (nx1965), .S0 (nx3230)) ;
    nand02 ix1964 (.Y (nx1963), .A0 (B[5]), .A1 (A[13])) ;
    mux21_ni ix1966 (.Y (nx1965), .A0 (nx1967), .A1 (nx1969), .S0 (nx3240)) ;
    nand02 ix1968 (.Y (nx1967), .A0 (B[5]), .A1 (A[12])) ;
    mux21_ni ix1970 (.Y (nx1969), .A0 (nx1971), .A1 (nx2047), .S0 (nx2049)) ;
    mux21_ni ix1972 (.Y (nx1971), .A0 (nx1973), .A1 (nx1975), .S0 (nx1684)) ;
    nand02 ix1974 (.Y (nx1973), .A0 (B[5]), .A1 (A[10])) ;
    mux21_ni ix1976 (.Y (nx1975), .A0 (nx1977), .A1 (nx1979), .S0 (nx1330)) ;
    nand02 ix1978 (.Y (nx1977), .A0 (B[5]), .A1 (A[9])) ;
    mux21_ni ix1980 (.Y (nx1979), .A0 (nx1981), .A1 (nx1983), .S0 (nx1006)) ;
    nand02 ix1982 (.Y (nx1981), .A0 (B[5]), .A1 (A[8])) ;
    mux21_ni ix1984 (.Y (nx1983), .A0 (nx1985), .A1 (nx1987), .S0 (nx740)) ;
    nand02 ix1986 (.Y (nx1985), .A0 (B[5]), .A1 (A[7])) ;
    mux21_ni ix1988 (.Y (nx1987), .A0 (nx1989), .A1 (nx1991), .S0 (nx530)) ;
    nand02 ix1990 (.Y (nx1989), .A0 (B[5]), .A1 (A[6])) ;
    mux21_ni ix1992 (.Y (nx1991), .A0 (nx1993), .A1 (nx1995), .S0 (nx376)) ;
    nand02 ix1994 (.Y (nx1993), .A0 (B[5]), .A1 (A[5])) ;
    mux21_ni ix1996 (.Y (nx1995), .A0 (nx1997), .A1 (nx1999), .S0 (nx276)) ;
    nand02 ix1998 (.Y (nx1997), .A0 (A[4]), .A1 (B[5])) ;
    mux21_ni ix2000 (.Y (nx1999), .A0 (nx2001), .A1 (nx2003), .S0 (nx286)) ;
    nand02 ix2002 (.Y (nx2001), .A0 (A[3]), .A1 (B[5])) ;
    mux21_ni ix2004 (.Y (nx2003), .A0 (nx2005), .A1 (nx2007), .S0 (nx304)) ;
    nand02 ix2006 (.Y (nx2005), .A0 (A[2]), .A1 (B[5])) ;
    nand03 ix2008 (.Y (nx2007), .A0 (nx220), .A1 (B[5]), .A2 (B[6])) ;
    xnor2 ix305 (.Y (nx304), .A0 (nx302), .A1 (nx2005)) ;
    nor02ii ix303 (.Y (nx302), .A0 (nx2013), .A1 (nx1889)) ;
    aoi22 ix2014 (.Y (nx2013), .A0 (A[1]), .A1 (B[6]), .B0 (A[0]), .B1 (B[7])) ;
    xnor2 ix287 (.Y (nx286), .A0 (nx284), .A1 (nx2001)) ;
    xnor2 ix285 (.Y (nx284), .A0 (nx1889), .A1 (nx236)) ;
    xnor2 ix277 (.Y (nx276), .A0 (nx274), .A1 (nx1997)) ;
    xnor2 ix275 (.Y (nx274), .A0 (nx1885), .A1 (nx272)) ;
    xnor2 ix377 (.Y (nx376), .A0 (nx372), .A1 (nx1993)) ;
    xnor2 ix373 (.Y (nx372), .A0 (nx1881), .A1 (nx370)) ;
    xnor2 ix531 (.Y (nx530), .A0 (nx526), .A1 (nx1989)) ;
    xnor2 ix527 (.Y (nx526), .A0 (nx1877), .A1 (nx524)) ;
    xnor2 ix741 (.Y (nx740), .A0 (nx736), .A1 (nx1985)) ;
    xnor2 ix737 (.Y (nx736), .A0 (nx1873), .A1 (nx734)) ;
    xnor2 ix1007 (.Y (nx1006), .A0 (nx1002), .A1 (nx1981)) ;
    xnor2 ix1003 (.Y (nx1002), .A0 (nx1869), .A1 (nx1000)) ;
    xnor2 ix1331 (.Y (nx1330), .A0 (nx1326), .A1 (nx1977)) ;
    xnor2 ix1327 (.Y (nx1326), .A0 (nx1865), .A1 (nx1324)) ;
    xnor2 ix1685 (.Y (nx1684), .A0 (nx1680), .A1 (nx1973)) ;
    xnor2 ix1681 (.Y (nx1680), .A0 (nx1861), .A1 (nx1678)) ;
    nand02 ix2048 (.Y (nx2047), .A0 (B[5]), .A1 (A[11])) ;
    xnor2 ix2050 (.Y (nx2049), .A0 (nx2051), .A1 (nx2047)) ;
    xnor2 ix2052 (.Y (nx2051), .A0 (nx1857), .A1 (nx1927)) ;
    xnor2 ix3241 (.Y (nx3240), .A0 (nx3238), .A1 (nx1967)) ;
    xnor2 ix3239 (.Y (nx3238), .A0 (nx1855), .A1 (nx3150)) ;
    xnor2 ix3231 (.Y (nx3230), .A0 (nx3228), .A1 (nx1963)) ;
    xnor2 ix3229 (.Y (nx3228), .A0 (nx1851), .A1 (nx3140)) ;
    xnor2 ix3221 (.Y (nx3220), .A0 (nx3218), .A1 (nx1959)) ;
    xnor2 ix3219 (.Y (nx3218), .A0 (nx1847), .A1 (nx3130)) ;
    xnor2 ix3211 (.Y (nx3210), .A0 (nx3208), .A1 (nx2069)) ;
    xnor2 ix3209 (.Y (nx3208), .A0 (nx1843), .A1 (nx3120)) ;
    nand02 ix2070 (.Y (nx2069), .A0 (B[5]), .A1 (A[15])) ;
    mux21_ni ix3517 (.Y (nx3516), .A0 (nx3362), .A1 (nx3512), .S0 (nx3414)) ;
    xnor2 ix3363 (.Y (nx3362), .A0 (nx2075), .A1 (nx3296)) ;
    mux21_ni ix2076 (.Y (nx2075), .A0 (nx2077), .A1 (nx2079), .S0 (nx3306)) ;
    nand02 ix2078 (.Y (nx2077), .A0 (B[4]), .A1 (A[14])) ;
    mux21_ni ix2080 (.Y (nx2079), .A0 (nx2081), .A1 (nx2083), .S0 (nx3316)) ;
    nand02 ix2082 (.Y (nx2081), .A0 (B[4]), .A1 (A[13])) ;
    mux21_ni ix2084 (.Y (nx2083), .A0 (nx2085), .A1 (nx2169), .S0 (nx2171)) ;
    mux21_ni ix2086 (.Y (nx2085), .A0 (nx2087), .A1 (nx2089), .S0 (nx1690)) ;
    nand02 ix2088 (.Y (nx2087), .A0 (B[4]), .A1 (A[11])) ;
    mux21_ni ix2090 (.Y (nx2089), .A0 (nx2091), .A1 (nx2093), .S0 (nx1336)) ;
    nand02 ix2092 (.Y (nx2091), .A0 (B[4]), .A1 (A[10])) ;
    mux21_ni ix2094 (.Y (nx2093), .A0 (nx2095), .A1 (nx2097), .S0 (nx1012)) ;
    nand02 ix2096 (.Y (nx2095), .A0 (B[4]), .A1 (A[9])) ;
    mux21_ni ix2098 (.Y (nx2097), .A0 (nx2099), .A1 (nx2101), .S0 (nx746)) ;
    nand02 ix2100 (.Y (nx2099), .A0 (B[4]), .A1 (A[8])) ;
    mux21_ni ix2102 (.Y (nx2101), .A0 (nx2103), .A1 (nx2105), .S0 (nx536)) ;
    nand02 ix2104 (.Y (nx2103), .A0 (B[4]), .A1 (A[7])) ;
    mux21_ni ix2106 (.Y (nx2105), .A0 (nx2107), .A1 (nx2109), .S0 (nx380)) ;
    nand02 ix2108 (.Y (nx2107), .A0 (B[4]), .A1 (A[6])) ;
    mux21_ni ix2110 (.Y (nx2109), .A0 (nx2111), .A1 (nx2113), .S0 (nx390)) ;
    nand02 ix2112 (.Y (nx2111), .A0 (B[4]), .A1 (A[5])) ;
    mux21_ni ix2114 (.Y (nx2113), .A0 (nx2115), .A1 (nx2117), .S0 (nx400)) ;
    nand02 ix2116 (.Y (nx2115), .A0 (B[4]), .A1 (A[4])) ;
    mux21_ni ix2118 (.Y (nx2117), .A0 (nx2119), .A1 (nx2121), .S0 (nx410)) ;
    nand02 ix2120 (.Y (nx2119), .A0 (A[3]), .A1 (B[4])) ;
    mux21_ni ix2122 (.Y (nx2121), .A0 (nx2123), .A1 (nx2125), .S0 (nx428)) ;
    nand02 ix2124 (.Y (nx2123), .A0 (A[2]), .A1 (B[4])) ;
    nand03 ix2126 (.Y (nx2125), .A0 (nx220), .A1 (B[4]), .A2 (B[5])) ;
    xnor2 ix429 (.Y (nx428), .A0 (nx426), .A1 (nx2123)) ;
    nor02ii ix427 (.Y (nx426), .A0 (nx2131), .A1 (nx2007)) ;
    aoi22 ix2132 (.Y (nx2131), .A0 (A[1]), .A1 (B[5]), .B0 (A[0]), .B1 (B[6])) ;
    xnor2 ix411 (.Y (nx410), .A0 (nx408), .A1 (nx2119)) ;
    xnor2 ix409 (.Y (nx408), .A0 (nx2007), .A1 (nx304)) ;
    xnor2 ix401 (.Y (nx400), .A0 (nx398), .A1 (nx2115)) ;
    xnor2 ix399 (.Y (nx398), .A0 (nx2003), .A1 (nx286)) ;
    xnor2 ix391 (.Y (nx390), .A0 (nx388), .A1 (nx2111)) ;
    xnor2 ix389 (.Y (nx388), .A0 (nx1999), .A1 (nx276)) ;
    xnor2 ix381 (.Y (nx380), .A0 (nx378), .A1 (nx2107)) ;
    xnor2 ix379 (.Y (nx378), .A0 (nx1995), .A1 (nx376)) ;
    xnor2 ix537 (.Y (nx536), .A0 (nx532), .A1 (nx2103)) ;
    xnor2 ix533 (.Y (nx532), .A0 (nx1991), .A1 (nx530)) ;
    xnor2 ix747 (.Y (nx746), .A0 (nx742), .A1 (nx2099)) ;
    xnor2 ix743 (.Y (nx742), .A0 (nx1987), .A1 (nx740)) ;
    xnor2 ix1013 (.Y (nx1012), .A0 (nx1008), .A1 (nx2095)) ;
    xnor2 ix1009 (.Y (nx1008), .A0 (nx1983), .A1 (nx1006)) ;
    xnor2 ix1337 (.Y (nx1336), .A0 (nx1332), .A1 (nx2091)) ;
    xnor2 ix1333 (.Y (nx1332), .A0 (nx1979), .A1 (nx1330)) ;
    xnor2 ix1691 (.Y (nx1690), .A0 (nx1686), .A1 (nx2087)) ;
    xnor2 ix1687 (.Y (nx1686), .A0 (nx1975), .A1 (nx1684)) ;
    nand02 ix2170 (.Y (nx2169), .A0 (B[4]), .A1 (A[12])) ;
    xnor2 ix2172 (.Y (nx2171), .A0 (nx2173), .A1 (nx2169)) ;
    xnor2 ix2174 (.Y (nx2173), .A0 (nx1971), .A1 (nx2049)) ;
    xnor2 ix3317 (.Y (nx3316), .A0 (nx3314), .A1 (nx2081)) ;
    xnor2 ix3315 (.Y (nx3314), .A0 (nx1969), .A1 (nx3240)) ;
    xnor2 ix3307 (.Y (nx3306), .A0 (nx3304), .A1 (nx2077)) ;
    xnor2 ix3305 (.Y (nx3304), .A0 (nx1965), .A1 (nx3230)) ;
    xnor2 ix3297 (.Y (nx3296), .A0 (nx3294), .A1 (nx2187)) ;
    xnor2 ix3295 (.Y (nx3294), .A0 (nx1961), .A1 (nx3220)) ;
    nand02 ix2188 (.Y (nx2187), .A0 (B[4]), .A1 (A[15])) ;
    mux21_ni ix3513 (.Y (nx3512), .A0 (nx3420), .A1 (nx3508), .S0 (nx3458)) ;
    xnor2 ix3421 (.Y (nx3420), .A0 (nx2193), .A1 (nx3368)) ;
    mux21_ni ix2194 (.Y (nx2193), .A0 (nx2195), .A1 (nx2197), .S0 (nx3378)) ;
    nand02 ix2196 (.Y (nx2195), .A0 (B[3]), .A1 (A[14])) ;
    mux21_ni ix2198 (.Y (nx2197), .A0 (nx2199), .A1 (nx2291), .S0 (nx2293)) ;
    mux21_ni ix2200 (.Y (nx2199), .A0 (nx2201), .A1 (nx2203), .S0 (nx1696)) ;
    nand02 ix2202 (.Y (nx2201), .A0 (B[3]), .A1 (A[12])) ;
    mux21_ni ix2204 (.Y (nx2203), .A0 (nx2205), .A1 (nx2207), .S0 (nx1342)) ;
    nand02 ix2206 (.Y (nx2205), .A0 (B[3]), .A1 (A[11])) ;
    mux21_ni ix2208 (.Y (nx2207), .A0 (nx2209), .A1 (nx2211), .S0 (nx1018)) ;
    nand02 ix2210 (.Y (nx2209), .A0 (B[3]), .A1 (A[10])) ;
    mux21_ni ix2212 (.Y (nx2211), .A0 (nx2213), .A1 (nx2215), .S0 (nx752)) ;
    nand02 ix2214 (.Y (nx2213), .A0 (B[3]), .A1 (A[9])) ;
    mux21_ni ix2216 (.Y (nx2215), .A0 (nx2217), .A1 (nx2219), .S0 (nx540)) ;
    nand02 ix2218 (.Y (nx2217), .A0 (B[3]), .A1 (A[8])) ;
    mux21_ni ix2220 (.Y (nx2219), .A0 (nx2221), .A1 (nx2223), .S0 (nx550)) ;
    nand02 ix2222 (.Y (nx2221), .A0 (B[3]), .A1 (A[7])) ;
    mux21_ni ix2224 (.Y (nx2223), .A0 (nx2225), .A1 (nx2227), .S0 (nx560)) ;
    nand02 ix2226 (.Y (nx2225), .A0 (B[3]), .A1 (A[6])) ;
    mux21_ni ix2228 (.Y (nx2227), .A0 (nx2229), .A1 (nx2231), .S0 (nx570)) ;
    nand02 ix2230 (.Y (nx2229), .A0 (B[3]), .A1 (A[5])) ;
    mux21_ni ix2232 (.Y (nx2231), .A0 (nx2233), .A1 (nx2235), .S0 (nx580)) ;
    nand02 ix2234 (.Y (nx2233), .A0 (B[3]), .A1 (A[4])) ;
    mux21_ni ix2236 (.Y (nx2235), .A0 (nx2237), .A1 (nx2239), .S0 (nx590)) ;
    nand02 ix2238 (.Y (nx2237), .A0 (B[3]), .A1 (A[3])) ;
    mux21_ni ix2240 (.Y (nx2239), .A0 (nx2241), .A1 (nx2243), .S0 (nx608)) ;
    nand02 ix2242 (.Y (nx2241), .A0 (A[2]), .A1 (B[3])) ;
    nand03 ix2244 (.Y (nx2243), .A0 (nx220), .A1 (B[3]), .A2 (B[4])) ;
    xnor2 ix609 (.Y (nx608), .A0 (nx606), .A1 (nx2241)) ;
    nor02ii ix607 (.Y (nx606), .A0 (nx2249), .A1 (nx2125)) ;
    aoi22 ix2250 (.Y (nx2249), .A0 (A[1]), .A1 (B[4]), .B0 (A[0]), .B1 (B[5])) ;
    xnor2 ix591 (.Y (nx590), .A0 (nx588), .A1 (nx2237)) ;
    xnor2 ix589 (.Y (nx588), .A0 (nx2125), .A1 (nx428)) ;
    xnor2 ix581 (.Y (nx580), .A0 (nx578), .A1 (nx2233)) ;
    xnor2 ix579 (.Y (nx578), .A0 (nx2121), .A1 (nx410)) ;
    xnor2 ix571 (.Y (nx570), .A0 (nx568), .A1 (nx2229)) ;
    xnor2 ix569 (.Y (nx568), .A0 (nx2117), .A1 (nx400)) ;
    xnor2 ix561 (.Y (nx560), .A0 (nx558), .A1 (nx2225)) ;
    xnor2 ix559 (.Y (nx558), .A0 (nx2113), .A1 (nx390)) ;
    xnor2 ix551 (.Y (nx550), .A0 (nx548), .A1 (nx2221)) ;
    xnor2 ix549 (.Y (nx548), .A0 (nx2109), .A1 (nx380)) ;
    xnor2 ix541 (.Y (nx540), .A0 (nx538), .A1 (nx2217)) ;
    xnor2 ix539 (.Y (nx538), .A0 (nx2105), .A1 (nx536)) ;
    xnor2 ix753 (.Y (nx752), .A0 (nx748), .A1 (nx2213)) ;
    xnor2 ix749 (.Y (nx748), .A0 (nx2101), .A1 (nx746)) ;
    xnor2 ix1019 (.Y (nx1018), .A0 (nx1014), .A1 (nx2209)) ;
    xnor2 ix1015 (.Y (nx1014), .A0 (nx2097), .A1 (nx1012)) ;
    xnor2 ix1343 (.Y (nx1342), .A0 (nx1338), .A1 (nx2205)) ;
    xnor2 ix1339 (.Y (nx1338), .A0 (nx2093), .A1 (nx1336)) ;
    xnor2 ix1697 (.Y (nx1696), .A0 (nx1692), .A1 (nx2201)) ;
    xnor2 ix1693 (.Y (nx1692), .A0 (nx2089), .A1 (nx1690)) ;
    nand02 ix2292 (.Y (nx2291), .A0 (B[3]), .A1 (A[13])) ;
    xnor2 ix2294 (.Y (nx2293), .A0 (nx2295), .A1 (nx2291)) ;
    xnor2 ix2296 (.Y (nx2295), .A0 (nx2085), .A1 (nx2171)) ;
    xnor2 ix3379 (.Y (nx3378), .A0 (nx3376), .A1 (nx2195)) ;
    xnor2 ix3377 (.Y (nx3376), .A0 (nx2083), .A1 (nx3316)) ;
    xnor2 ix3369 (.Y (nx3368), .A0 (nx3366), .A1 (nx2305)) ;
    xnor2 ix3367 (.Y (nx3366), .A0 (nx2079), .A1 (nx3306)) ;
    nand02 ix2306 (.Y (nx2305), .A0 (B[3]), .A1 (A[15])) ;
    mux21_ni ix3509 (.Y (nx3508), .A0 (nx3464), .A1 (nx3504), .S0 (nx3488)) ;
    xnor2 ix3465 (.Y (nx3464), .A0 (nx2311), .A1 (nx3426)) ;
    mux21_ni ix2312 (.Y (nx2311), .A0 (nx2313), .A1 (nx2413), .S0 (nx2415)) ;
    mux21_ni ix2314 (.Y (nx2313), .A0 (nx2315), .A1 (nx2317), .S0 (nx1702)) ;
    nand02 ix2316 (.Y (nx2315), .A0 (B[2]), .A1 (A[13])) ;
    mux21_ni ix2318 (.Y (nx2317), .A0 (nx2319), .A1 (nx2321), .S0 (nx1348)) ;
    nand02 ix2320 (.Y (nx2319), .A0 (B[2]), .A1 (A[12])) ;
    mux21_ni ix2322 (.Y (nx2321), .A0 (nx2323), .A1 (nx2325), .S0 (nx1024)) ;
    nand02 ix2324 (.Y (nx2323), .A0 (B[2]), .A1 (A[11])) ;
    mux21_ni ix2326 (.Y (nx2325), .A0 (nx2327), .A1 (nx2329), .S0 (nx756)) ;
    nand02 ix2328 (.Y (nx2327), .A0 (B[2]), .A1 (A[10])) ;
    mux21_ni ix2330 (.Y (nx2329), .A0 (nx2331), .A1 (nx2333), .S0 (nx766)) ;
    nand02 ix2332 (.Y (nx2331), .A0 (B[2]), .A1 (A[9])) ;
    mux21_ni ix2334 (.Y (nx2333), .A0 (nx2335), .A1 (nx2337), .S0 (nx776)) ;
    nand02 ix2336 (.Y (nx2335), .A0 (B[2]), .A1 (A[8])) ;
    mux21_ni ix2338 (.Y (nx2337), .A0 (nx2339), .A1 (nx2341), .S0 (nx786)) ;
    nand02 ix2340 (.Y (nx2339), .A0 (B[2]), .A1 (A[7])) ;
    mux21_ni ix2342 (.Y (nx2341), .A0 (nx2343), .A1 (nx2345), .S0 (nx796)) ;
    nand02 ix2344 (.Y (nx2343), .A0 (B[2]), .A1 (A[6])) ;
    mux21_ni ix2346 (.Y (nx2345), .A0 (nx2347), .A1 (nx2349), .S0 (nx806)) ;
    nand02 ix2348 (.Y (nx2347), .A0 (B[2]), .A1 (A[5])) ;
    mux21_ni ix2350 (.Y (nx2349), .A0 (nx2351), .A1 (nx2353), .S0 (nx816)) ;
    nand02 ix2352 (.Y (nx2351), .A0 (B[2]), .A1 (A[4])) ;
    mux21_ni ix2354 (.Y (nx2353), .A0 (nx2355), .A1 (nx2357), .S0 (nx826)) ;
    nand02 ix2356 (.Y (nx2355), .A0 (B[2]), .A1 (A[3])) ;
    mux21_ni ix2358 (.Y (nx2357), .A0 (nx2359), .A1 (nx2361), .S0 (nx844)) ;
    nand02 ix2360 (.Y (nx2359), .A0 (B[2]), .A1 (A[2])) ;
    nand03 ix2362 (.Y (nx2361), .A0 (nx220), .A1 (B[2]), .A2 (B[3])) ;
    xnor2 ix845 (.Y (nx844), .A0 (nx842), .A1 (nx2359)) ;
    nor02ii ix843 (.Y (nx842), .A0 (nx2367), .A1 (nx2243)) ;
    aoi22 ix2368 (.Y (nx2367), .A0 (A[1]), .A1 (B[3]), .B0 (A[0]), .B1 (B[4])) ;
    xnor2 ix827 (.Y (nx826), .A0 (nx824), .A1 (nx2355)) ;
    xnor2 ix825 (.Y (nx824), .A0 (nx2243), .A1 (nx608)) ;
    xnor2 ix817 (.Y (nx816), .A0 (nx814), .A1 (nx2351)) ;
    xnor2 ix815 (.Y (nx814), .A0 (nx2239), .A1 (nx590)) ;
    xnor2 ix807 (.Y (nx806), .A0 (nx804), .A1 (nx2347)) ;
    xnor2 ix805 (.Y (nx804), .A0 (nx2235), .A1 (nx580)) ;
    xnor2 ix797 (.Y (nx796), .A0 (nx794), .A1 (nx2343)) ;
    xnor2 ix795 (.Y (nx794), .A0 (nx2231), .A1 (nx570)) ;
    xnor2 ix787 (.Y (nx786), .A0 (nx784), .A1 (nx2339)) ;
    xnor2 ix785 (.Y (nx784), .A0 (nx2227), .A1 (nx560)) ;
    xnor2 ix777 (.Y (nx776), .A0 (nx774), .A1 (nx2335)) ;
    xnor2 ix775 (.Y (nx774), .A0 (nx2223), .A1 (nx550)) ;
    xnor2 ix767 (.Y (nx766), .A0 (nx764), .A1 (nx2331)) ;
    xnor2 ix765 (.Y (nx764), .A0 (nx2219), .A1 (nx540)) ;
    xnor2 ix757 (.Y (nx756), .A0 (nx754), .A1 (nx2327)) ;
    xnor2 ix755 (.Y (nx754), .A0 (nx2215), .A1 (nx752)) ;
    xnor2 ix1025 (.Y (nx1024), .A0 (nx1020), .A1 (nx2323)) ;
    xnor2 ix1021 (.Y (nx1020), .A0 (nx2211), .A1 (nx1018)) ;
    xnor2 ix1349 (.Y (nx1348), .A0 (nx1344), .A1 (nx2319)) ;
    xnor2 ix1345 (.Y (nx1344), .A0 (nx2207), .A1 (nx1342)) ;
    xnor2 ix1703 (.Y (nx1702), .A0 (nx1698), .A1 (nx2315)) ;
    xnor2 ix1699 (.Y (nx1698), .A0 (nx2203), .A1 (nx1696)) ;
    nand02 ix2414 (.Y (nx2413), .A0 (B[2]), .A1 (A[14])) ;
    xnor2 ix2416 (.Y (nx2415), .A0 (nx2417), .A1 (nx2413)) ;
    xnor2 ix2418 (.Y (nx2417), .A0 (nx2199), .A1 (nx2293)) ;
    xnor2 ix3427 (.Y (nx3426), .A0 (nx3424), .A1 (nx2423)) ;
    xnor2 ix3425 (.Y (nx3424), .A0 (nx2197), .A1 (nx3378)) ;
    nand02 ix2424 (.Y (nx2423), .A0 (B[2]), .A1 (A[15])) ;
    nor02ii ix3505 (.Y (nx3504), .A0 (nx2427), .A1 (nx3500)) ;
    xnor2 ix2428 (.Y (nx2427), .A0 (nx2429), .A1 (nx2537)) ;
    mux21_ni ix2430 (.Y (nx2429), .A0 (nx2431), .A1 (nx2433), .S0 (nx1708)) ;
    nand02 ix2432 (.Y (nx2431), .A0 (B[1]), .A1 (A[14])) ;
    mux21_ni ix2434 (.Y (nx2433), .A0 (nx2435), .A1 (nx2437), .S0 (nx1354)) ;
    nand02 ix2436 (.Y (nx2435), .A0 (B[1]), .A1 (A[13])) ;
    mux21_ni ix2438 (.Y (nx2437), .A0 (nx2439), .A1 (nx2441), .S0 (nx1028)) ;
    nand02 ix2440 (.Y (nx2439), .A0 (B[1]), .A1 (A[12])) ;
    mux21_ni ix2442 (.Y (nx2441), .A0 (nx2443), .A1 (nx2445), .S0 (nx1038)) ;
    nand02 ix2444 (.Y (nx2443), .A0 (B[1]), .A1 (A[11])) ;
    mux21_ni ix2446 (.Y (nx2445), .A0 (nx2447), .A1 (nx2449), .S0 (nx1048)) ;
    nand02 ix2448 (.Y (nx2447), .A0 (B[1]), .A1 (A[10])) ;
    mux21_ni ix2450 (.Y (nx2449), .A0 (nx2451), .A1 (nx2453), .S0 (nx1058)) ;
    nand02 ix2452 (.Y (nx2451), .A0 (B[1]), .A1 (A[9])) ;
    mux21_ni ix2454 (.Y (nx2453), .A0 (nx2455), .A1 (nx2457), .S0 (nx1068)) ;
    nand02 ix2456 (.Y (nx2455), .A0 (B[1]), .A1 (A[8])) ;
    mux21_ni ix2458 (.Y (nx2457), .A0 (nx2459), .A1 (nx2461), .S0 (nx1078)) ;
    nand02 ix2460 (.Y (nx2459), .A0 (B[1]), .A1 (A[7])) ;
    mux21_ni ix2462 (.Y (nx2461), .A0 (nx2463), .A1 (nx2465), .S0 (nx1088)) ;
    nand02 ix2464 (.Y (nx2463), .A0 (B[1]), .A1 (A[6])) ;
    mux21_ni ix2466 (.Y (nx2465), .A0 (nx2467), .A1 (nx2469), .S0 (nx1098)) ;
    nand02 ix2468 (.Y (nx2467), .A0 (B[1]), .A1 (A[5])) ;
    mux21_ni ix2470 (.Y (nx2469), .A0 (nx2471), .A1 (nx2473), .S0 (nx1108)) ;
    nand02 ix2472 (.Y (nx2471), .A0 (B[1]), .A1 (A[4])) ;
    mux21_ni ix2474 (.Y (nx2473), .A0 (nx2475), .A1 (nx2477), .S0 (nx1118)) ;
    nand02 ix2476 (.Y (nx2475), .A0 (B[1]), .A1 (A[3])) ;
    mux21_ni ix2478 (.Y (nx2477), .A0 (nx2479), .A1 (nx2481), .S0 (nx1136)) ;
    nand02 ix2480 (.Y (nx2479), .A0 (B[1]), .A1 (A[2])) ;
    nand04 ix2482 (.Y (nx2481), .A0 (B[1]), .A1 (A[1]), .A2 (A[0]), .A3 (B[2])
           ) ;
    xnor2 ix1137 (.Y (nx1136), .A0 (nx1134), .A1 (nx2479)) ;
    nor02ii ix1135 (.Y (nx1134), .A0 (nx2487), .A1 (nx2361)) ;
    aoi22 ix2488 (.Y (nx2487), .A0 (A[1]), .A1 (B[2]), .B0 (A[0]), .B1 (B[3])) ;
    xnor2 ix1119 (.Y (nx1118), .A0 (nx1116), .A1 (nx2475)) ;
    xnor2 ix1117 (.Y (nx1116), .A0 (nx2361), .A1 (nx844)) ;
    xnor2 ix1109 (.Y (nx1108), .A0 (nx1106), .A1 (nx2471)) ;
    xnor2 ix1107 (.Y (nx1106), .A0 (nx2357), .A1 (nx826)) ;
    xnor2 ix1099 (.Y (nx1098), .A0 (nx1096), .A1 (nx2467)) ;
    xnor2 ix1097 (.Y (nx1096), .A0 (nx2353), .A1 (nx816)) ;
    xnor2 ix1089 (.Y (nx1088), .A0 (nx1086), .A1 (nx2463)) ;
    xnor2 ix1087 (.Y (nx1086), .A0 (nx2349), .A1 (nx806)) ;
    xnor2 ix1079 (.Y (nx1078), .A0 (nx1076), .A1 (nx2459)) ;
    xnor2 ix1077 (.Y (nx1076), .A0 (nx2345), .A1 (nx796)) ;
    xnor2 ix1069 (.Y (nx1068), .A0 (nx1066), .A1 (nx2455)) ;
    xnor2 ix1067 (.Y (nx1066), .A0 (nx2341), .A1 (nx786)) ;
    xnor2 ix1059 (.Y (nx1058), .A0 (nx1056), .A1 (nx2451)) ;
    xnor2 ix1057 (.Y (nx1056), .A0 (nx2337), .A1 (nx776)) ;
    xnor2 ix1049 (.Y (nx1048), .A0 (nx1046), .A1 (nx2447)) ;
    xnor2 ix1047 (.Y (nx1046), .A0 (nx2333), .A1 (nx766)) ;
    xnor2 ix1039 (.Y (nx1038), .A0 (nx1036), .A1 (nx2443)) ;
    xnor2 ix1037 (.Y (nx1036), .A0 (nx2329), .A1 (nx756)) ;
    xnor2 ix1029 (.Y (nx1028), .A0 (nx1026), .A1 (nx2439)) ;
    xnor2 ix1027 (.Y (nx1026), .A0 (nx2325), .A1 (nx1024)) ;
    xnor2 ix1355 (.Y (nx1354), .A0 (nx1350), .A1 (nx2435)) ;
    xnor2 ix1351 (.Y (nx1350), .A0 (nx2321), .A1 (nx1348)) ;
    xnor2 ix1709 (.Y (nx1708), .A0 (nx1704), .A1 (nx2431)) ;
    xnor2 ix1705 (.Y (nx1704), .A0 (nx2317), .A1 (nx1702)) ;
    xnor2 ix2538 (.Y (nx2537), .A0 (nx2539), .A1 (nx2541)) ;
    xnor2 ix2540 (.Y (nx2539), .A0 (nx2313), .A1 (nx2415)) ;
    nand02 ix2542 (.Y (nx2541), .A0 (B[1]), .A1 (A[15])) ;
    mux21_ni ix3501 (.Y (nx3500), .A0 (nx46), .A1 (nx1520), .S0 (nx1712)) ;
    mux21_ni ix1521 (.Y (nx1520), .A0 (nx206), .A1 (nx1516), .S0 (nx1358)) ;
    mux21_ni ix1517 (.Y (nx1516), .A0 (nx56), .A1 (nx1512), .S0 (nx1366)) ;
    mux21_ni ix1513 (.Y (nx1512), .A0 (nx58), .A1 (nx1508), .S0 (nx1374)) ;
    mux21_ni ix1509 (.Y (nx1508), .A0 (nx72), .A1 (nx1504), .S0 (nx1382)) ;
    mux21_ni ix1505 (.Y (nx1504), .A0 (nx74), .A1 (nx1500), .S0 (nx1390)) ;
    mux21_ni ix1501 (.Y (nx1500), .A0 (nx86), .A1 (nx1496), .S0 (nx1398)) ;
    mux21_ni ix1497 (.Y (nx1496), .A0 (nx88), .A1 (nx1492), .S0 (nx1406)) ;
    mux21_ni ix1493 (.Y (nx1492), .A0 (nx104), .A1 (nx1488), .S0 (nx1414)) ;
    mux21_ni ix1489 (.Y (nx1488), .A0 (nx106), .A1 (nx1484), .S0 (nx1422)) ;
    mux21_ni ix1485 (.Y (nx1484), .A0 (nx118), .A1 (nx1480), .S0 (nx1430)) ;
    mux21_ni ix1481 (.Y (nx1480), .A0 (nx120), .A1 (nx1476), .S0 (nx1438)) ;
    mux21_ni ix1477 (.Y (nx1476), .A0 (nx136), .A1 (nx1472), .S0 (nx1446)) ;
    mux21_ni ix1473 (.Y (nx1472), .A0 (nx138), .A1 (nx1468), .S0 (nx1460)) ;
    nor02_2x ix1469 (.Y (nx1468), .A0 (nx2601), .A1 (nx2603)) ;
    nand02 ix2602 (.Y (nx2601), .A0 (B[0]), .A1 (A[0])) ;
    nand02 ix2604 (.Y (nx2603), .A0 (B[1]), .A1 (A[1])) ;
    xnor2 ix1461 (.Y (nx1460), .A0 (nx1458), .A1 (nx2611)) ;
    nor02ii ix1459 (.Y (nx1458), .A0 (nx2609), .A1 (nx2481)) ;
    aoi22 ix2610 (.Y (nx2609), .A0 (A[0]), .A1 (B[2]), .B0 (B[1]), .B1 (A[1])) ;
    nand02 ix2612 (.Y (nx2611), .A0 (B[0]), .A1 (A[2])) ;
    xnor2 ix1447 (.Y (nx1446), .A0 (nx1444), .A1 (nx2617)) ;
    xnor2 ix1445 (.Y (nx1444), .A0 (nx2481), .A1 (nx1136)) ;
    nand02 ix2618 (.Y (nx2617), .A0 (B[0]), .A1 (A[3])) ;
    xnor2 ix1439 (.Y (nx1438), .A0 (nx1436), .A1 (nx2623)) ;
    xnor2 ix1437 (.Y (nx1436), .A0 (nx2477), .A1 (nx1118)) ;
    nand02 ix2624 (.Y (nx2623), .A0 (B[0]), .A1 (A[4])) ;
    xnor2 ix1431 (.Y (nx1430), .A0 (nx1428), .A1 (nx2629)) ;
    xnor2 ix1429 (.Y (nx1428), .A0 (nx2473), .A1 (nx1108)) ;
    nand02 ix2630 (.Y (nx2629), .A0 (B[0]), .A1 (A[5])) ;
    xnor2 ix1423 (.Y (nx1422), .A0 (nx1420), .A1 (nx2635)) ;
    xnor2 ix1421 (.Y (nx1420), .A0 (nx2469), .A1 (nx1098)) ;
    nand02 ix2636 (.Y (nx2635), .A0 (B[0]), .A1 (A[6])) ;
    xnor2 ix1415 (.Y (nx1414), .A0 (nx1412), .A1 (nx2641)) ;
    xnor2 ix1413 (.Y (nx1412), .A0 (nx2465), .A1 (nx1088)) ;
    nand02 ix2642 (.Y (nx2641), .A0 (B[0]), .A1 (A[7])) ;
    xnor2 ix1407 (.Y (nx1406), .A0 (nx1404), .A1 (nx2647)) ;
    xnor2 ix1405 (.Y (nx1404), .A0 (nx2461), .A1 (nx1078)) ;
    nand02 ix2648 (.Y (nx2647), .A0 (B[0]), .A1 (A[8])) ;
    xnor2 ix1399 (.Y (nx1398), .A0 (nx1396), .A1 (nx2653)) ;
    xnor2 ix1397 (.Y (nx1396), .A0 (nx2457), .A1 (nx1068)) ;
    nand02 ix2654 (.Y (nx2653), .A0 (B[0]), .A1 (A[9])) ;
    xnor2 ix1391 (.Y (nx1390), .A0 (nx1388), .A1 (nx2659)) ;
    xnor2 ix1389 (.Y (nx1388), .A0 (nx2453), .A1 (nx1058)) ;
    nand02 ix2660 (.Y (nx2659), .A0 (B[0]), .A1 (A[10])) ;
    xnor2 ix1383 (.Y (nx1382), .A0 (nx1380), .A1 (nx2665)) ;
    xnor2 ix1381 (.Y (nx1380), .A0 (nx2449), .A1 (nx1048)) ;
    nand02 ix2666 (.Y (nx2665), .A0 (B[0]), .A1 (A[11])) ;
    xnor2 ix1375 (.Y (nx1374), .A0 (nx1372), .A1 (nx2671)) ;
    xnor2 ix1373 (.Y (nx1372), .A0 (nx2445), .A1 (nx1038)) ;
    nand02 ix2672 (.Y (nx2671), .A0 (B[0]), .A1 (A[12])) ;
    xnor2 ix1367 (.Y (nx1366), .A0 (nx1364), .A1 (nx2677)) ;
    xnor2 ix1365 (.Y (nx1364), .A0 (nx2441), .A1 (nx1028)) ;
    nand02 ix2678 (.Y (nx2677), .A0 (B[0]), .A1 (A[13])) ;
    xnor2 ix1359 (.Y (nx1358), .A0 (nx1356), .A1 (nx2683)) ;
    xnor2 ix1357 (.Y (nx1356), .A0 (nx2437), .A1 (nx1354)) ;
    nand02 ix2684 (.Y (nx2683), .A0 (B[0]), .A1 (A[14])) ;
    xnor2 ix1713 (.Y (nx1712), .A0 (nx1710), .A1 (nx2689)) ;
    xnor2 ix1711 (.Y (nx1710), .A0 (nx2433), .A1 (nx1708)) ;
    nand02 ix2690 (.Y (nx2689), .A0 (B[0]), .A1 (A[15])) ;
    xnor2 ix3489 (.Y (nx3488), .A0 (nx2693), .A1 (nx3464)) ;
    mux21_ni ix2694 (.Y (nx2693), .A0 (nx2429), .A1 (nx2541), .S0 (nx2537)) ;
    xnor2 ix3459 (.Y (nx3458), .A0 (nx2697), .A1 (nx3420)) ;
    mux21_ni ix2698 (.Y (nx2697), .A0 (nx2423), .A1 (nx2311), .S0 (nx3426)) ;
    xnor2 ix3415 (.Y (nx3414), .A0 (nx2701), .A1 (nx3362)) ;
    mux21_ni ix2702 (.Y (nx2701), .A0 (nx2305), .A1 (nx2193), .S0 (nx3368)) ;
    xnor2 ix3357 (.Y (nx3356), .A0 (nx2705), .A1 (nx3290)) ;
    mux21_ni ix2706 (.Y (nx2705), .A0 (nx2187), .A1 (nx2075), .S0 (nx3296)) ;
    xnor2 ix3285 (.Y (nx3284), .A0 (nx2709), .A1 (nx3204)) ;
    mux21_ni ix2710 (.Y (nx2709), .A0 (nx2069), .A1 (nx1957), .S0 (nx3210)) ;
    xnor2 ix3199 (.Y (nx3198), .A0 (nx2713), .A1 (nx3104)) ;
    mux21_ni ix2714 (.Y (nx2713), .A0 (nx1951), .A1 (nx1839), .S0 (nx3110)) ;
    xnor2 ix3099 (.Y (nx3098), .A0 (nx2717), .A1 (nx2990)) ;
    mux21_ni ix2718 (.Y (nx2717), .A0 (nx1833), .A1 (nx1727), .S0 (nx2996)) ;
    xnor2 ix2985 (.Y (nx2984), .A0 (nx2721), .A1 (nx2862)) ;
    mux21_ni ix2722 (.Y (nx2721), .A0 (nx1723), .A1 (nx1611), .S0 (nx2868)) ;
    xnor2 ix2857 (.Y (nx2856), .A0 (nx2725), .A1 (nx2720)) ;
    mux21_ni ix2726 (.Y (nx2725), .A0 (nx1605), .A1 (nx1493), .S0 (nx2726)) ;
    xnor2 ix2715 (.Y (nx2714), .A0 (nx2729), .A1 (nx2564)) ;
    mux21_ni ix2730 (.Y (nx2729), .A0 (nx1487), .A1 (nx1375), .S0 (nx2570)) ;
    xnor2 ix2559 (.Y (nx2558), .A0 (nx2733), .A1 (nx2394)) ;
    mux21_ni ix2734 (.Y (nx2733), .A0 (nx1369), .A1 (nx1257), .S0 (nx2400)) ;
    xnor2 ix2389 (.Y (nx2388), .A0 (nx2737), .A1 (nx2210)) ;
    mux21_ni ix2738 (.Y (nx2737), .A0 (nx1251), .A1 (nx1139), .S0 (nx2216)) ;
    xnor2 ix2205 (.Y (nx2204), .A0 (nx2741), .A1 (nx2012)) ;
    mux21_ni ix2742 (.Y (nx2741), .A0 (nx1133), .A1 (nx1015), .S0 (nx2018)) ;
    xnor2 ix2007 (.Y (nx2006), .A0 (nx2004), .A1 (nx2749)) ;
    mux21_ni ix2005 (.Y (nx2004), .A0 (nx2000), .A1 (nx1812), .S0 (nx1005)) ;
    nand02 ix2750 (.Y (nx2749), .A0 (B[15]), .A1 (A[15])) ;
    nand04 ix1807 (.Y (Res1[15]), .A0 (nx2753), .A1 (nx2787), .A2 (nx2803), .A3 (
           nx2819)) ;
    aoi222 ix2754 (.Y (nx2753), .A0 (Add_Res_15), .A1 (nx3373), .B0 (Cin), .B1 (
           nx3415), .C0 (nx1776), .C1 (nx3487)) ;
    inv01 ix2758 (.Y (nx2757), .A (Opr[2])) ;
    and03 ix1795 (.Y (nx1794), .A0 (nx2761), .A1 (Opr[0]), .A2 (Opr[2])) ;
    inv01 ix2764 (.Y (nx2763), .A (Opr[3])) ;
    nand02 ix2774 (.Y (nx2773), .A0 (B[0]), .A1 (B[1])) ;
    nand03 ix2776 (.Y (nx2775), .A0 (nx26), .A1 (Opr[0]), .A2 (nx2783)) ;
    nand03 ix2786 (.Y (nx2785), .A0 (B[2]), .A1 (B[0]), .A2 (B[1])) ;
    aoi222 ix2788 (.Y (nx2787), .A0 (nx2789), .A1 (nx3405), .B0 (B[14]), .B1 (
           nx3391), .C0 (A[15]), .C1 (nx3399)) ;
    inv01 ix2790 (.Y (nx2789), .A (B[15])) ;
    nor02_2x ix1765 (.Y (nx1764), .A0 (nx2793), .A1 (nx2795)) ;
    nand02 ix2794 (.Y (nx2793), .A0 (Opr[3]), .A1 (Opr[1])) ;
    nand02 ix2796 (.Y (nx2795), .A0 (Opr[0]), .A1 (nx2757)) ;
    oai33 ix1761 (.Y (nx1760), .A0 (nx2795), .A1 (Opr[3]), .A2 (Opr[1]), .B0 (
          nx2793), .B1 (Opr[0]), .B2 (Opr[2])) ;
    aoi21 ix2804 (.Y (nx2803), .A0 (B[15]), .A1 (nx3381), .B0 (nx1734)) ;
    oai33 ix203 (.Y (nx202), .A0 (nx2761), .A1 (Opr[0]), .A2 (Opr[2]), .B0 (
          nx3373), .B1 (nx2807), .B2 (Opr[3])) ;
    inv01 ix2808 (.Y (nx2807), .A (Opr[1])) ;
    oai22 ix1735 (.Y (nx1734), .A0 (nx2811), .A1 (nx3421), .B0 (nx2749), .B1 (
          nx3431)) ;
    xnor2 ix2812 (.Y (nx2811), .A0 (nx1520), .A1 (nx1712)) ;
    nand02 ix2814 (.Y (nx2813), .A0 (nx2761), .A1 (nx198)) ;
    nor02_2x ix199 (.Y (nx198), .A0 (Opr[0]), .A1 (Opr[2])) ;
    aoi221 ix2820 (.Y (nx2819), .A0 (nx164), .A1 (nx170), .B0 (nx98), .B1 (
           nx3475), .C0 (nx70)) ;
    oai21 ix157 (.Y (nx156), .A0 (B[0]), .A1 (nx803), .B0 (nx2827)) ;
    nand02 ix2828 (.Y (nx2827), .A0 (B[0]), .A1 (A[1])) ;
    oai21 ix145 (.Y (nx144), .A0 (nx811), .A1 (B[0]), .B0 (nx2617)) ;
    oai21 ix2832 (.Y (nx2831), .A0 (B[1]), .A1 (B[0]), .B0 (nx2773)) ;
    oai21 ix127 (.Y (nx126), .A0 (nx819), .A1 (B[0]), .B0 (nx2629)) ;
    oai21 ix113 (.Y (nx112), .A0 (nx827), .A1 (B[0]), .B0 (nx2641)) ;
    oai21 ix2840 (.Y (nx2839), .A0 (nx0), .A1 (B[2]), .B0 (nx2785)) ;
    nor03_2x ix171 (.Y (nx170), .A0 (nx2845), .A1 (Opr[0]), .A2 (nx2783)) ;
    nand04 ix2846 (.Y (nx2845), .A0 (nx20), .A1 (Opr[2]), .A2 (Opr[3]), .A3 (
           Opr[1])) ;
    nand04 ix21 (.Y (nx20), .A0 (B[2]), .A1 (B[0]), .A2 (B[1]), .A3 (B[3])) ;
    oai21 ix95 (.Y (nx94), .A0 (nx835), .A1 (B[0]), .B0 (nx2653)) ;
    oai21 ix81 (.Y (nx80), .A0 (nx843), .A1 (B[0]), .B0 (nx2665)) ;
    xnor2 ix29 (.Y (nx28), .A0 (B[3]), .A1 (nx2785)) ;
    ao32 ix71 (.Y (nx70), .A0 (nx3435), .A1 (nx3367), .A2 (nx52), .B0 (nx64), .B1 (
         nx66)) ;
    oai21 ix53 (.Y (nx52), .A0 (B[0]), .A1 (nx859), .B0 (nx2689)) ;
    oai21 ix65 (.Y (nx64), .A0 (nx851), .A1 (B[0]), .B0 (nx2677)) ;
    nand02 ix2872 (.Y (nx2871), .A0 (nx3445), .A1 (nx36)) ;
    nor03_2x ix37 (.Y (nx36), .A0 (nx2845), .A1 (Opr[0]), .A2 (nx28)) ;
    aoi44 ix2876 (.Y (nx2875), .A0 (nx4216), .A1 (nx4486), .A2 (nx4734), .A3 (
          nx4916), .B0 (nx3660), .B1 (nx3686), .B2 (nx3708), .B3 (nx3752)) ;
    nor04 ix4217 (.Y (nx4216), .A0 (Res1[0]), .A1 (Res1[1]), .A2 (Res1[2]), .A3 (
          Res1[3])) ;
    nand04 ix3903 (.Y (Res1[0]), .A0 (nx2881), .A1 (nx2885), .A2 (nx2887), .A3 (
           nx2913)) ;
    aoi32 ix2882 (.Y (nx2881), .A0 (nx1466), .A1 (nx3435), .A2 (nx3367), .B0 (
          Add_Res_0), .B1 (nx3373)) ;
    aoi222 ix2886 (.Y (nx2885), .A0 (B[1]), .A1 (nx3415), .B0 (Cin), .B1 (nx3391
           ), .C0 (A[0]), .C1 (nx3399)) ;
    aoi222 ix2888 (.Y (nx2887), .A0 (B[0]), .A1 (nx3381), .B0 (nx3866), .B1 (
           nx3870), .C0 (nx3814), .C1 (nx3481)) ;
    oai21 ix3859 (.Y (nx3858), .A0 (nx863), .A1 (B[0]), .B0 (nx2683)) ;
    oai21 ix3849 (.Y (nx3848), .A0 (nx855), .A1 (B[0]), .B0 (nx2671)) ;
    oai21 ix3835 (.Y (nx3834), .A0 (nx847), .A1 (B[0]), .B0 (nx2659)) ;
    oai21 ix3825 (.Y (nx3824), .A0 (nx839), .A1 (B[0]), .B0 (nx2647)) ;
    oai21 ix3811 (.Y (nx3810), .A0 (nx831), .A1 (B[0]), .B0 (nx2635)) ;
    oai21 ix3801 (.Y (nx3800), .A0 (nx823), .A1 (B[0]), .B0 (nx2623)) ;
    aoi322 ix2914 (.Y (nx2913), .A0 (nx3762), .A1 (nx3363), .A2 (nx3487), .B0 (
           nx2917), .B1 (nx3784), .C0 (nx1466), .C1 (nx3778)) ;
    oai21 ix3763 (.Y (nx3762), .A0 (nx815), .A1 (B[0]), .B0 (nx2611)) ;
    inv01 ix2918 (.Y (nx2917), .A (B[0])) ;
    oai21 ix3785 (.Y (nx3784), .A0 (nx807), .A1 (nx2921), .B0 (nx2923)) ;
    nand02 ix2922 (.Y (nx2921), .A0 (nx3437), .A1 (nx3487)) ;
    oai21 ix3779 (.Y (nx3778), .A0 (Opr[2]), .A1 (nx192), .B0 (nx2921)) ;
    nand04 ix4033 (.Y (Res1[1]), .A0 (nx2929), .A1 (nx2933), .A2 (nx2937), .A3 (
           nx2949)) ;
    aoi222 ix2930 (.Y (nx2929), .A0 (Add_Res_1), .A1 (nx3373), .B0 (B[2]), .B1 (
           nx3415), .C0 (nx4018), .C1 (nx3367)) ;
    aoi222 ix2934 (.Y (nx2933), .A0 (nx2935), .A1 (nx3405), .B0 (B[0]), .B1 (
           nx3391), .C0 (A[1]), .C1 (nx3399)) ;
    inv01 ix2936 (.Y (nx2935), .A (B[1])) ;
    aoi222 ix2938 (.Y (nx2937), .A0 (nx1142), .A1 (nx1730), .B0 (nx3572), .B1 (
           nx3489), .C0 (B[1]), .C1 (nx3381)) ;
    nor02_2x ix3573 (.Y (nx3572), .A0 (nx1468), .A1 (nx2945)) ;
    aoi22 ix2946 (.Y (nx2945), .A0 (A[0]), .A1 (B[1]), .B0 (B[0]), .B1 (A[1])) ;
    aoi221 ix2950 (.Y (nx2949), .A0 (nx3984), .A1 (nx3870), .B0 (nx3940), .B1 (
           nx3481), .C0 (nx3920)) ;
    oai21 ix3973 (.Y (nx3972), .A0 (nx859), .A1 (B[0]), .B0 (nx2677)) ;
    oai21 ix3959 (.Y (nx3958), .A0 (nx851), .A1 (B[0]), .B0 (nx2665)) ;
    oai21 ix3949 (.Y (nx3948), .A0 (nx843), .A1 (B[0]), .B0 (nx2653)) ;
    oai21 ix3937 (.Y (nx3936), .A0 (nx835), .A1 (B[0]), .B0 (nx2641)) ;
    oai21 ix3927 (.Y (nx3926), .A0 (nx827), .A1 (B[0]), .B0 (nx2629)) ;
    ao32 ix3921 (.Y (nx3920), .A0 (nx3916), .A1 (nx3363), .A2 (nx3487), .B0 (
         nx3770), .B1 (nx3908)) ;
    oai21 ix3917 (.Y (nx3916), .A0 (nx819), .A1 (B[0]), .B0 (nx2617)) ;
    oai21 ix3909 (.Y (nx3908), .A0 (B[0]), .A1 (nx811), .B0 (nx2827)) ;
    nand04 ix4133 (.Y (Res1[2]), .A0 (nx2985), .A1 (nx2991), .A2 (nx2995), .A3 (
           nx3001)) ;
    aoi222 ix2986 (.Y (nx2985), .A0 (Add_Res_2), .A1 (nx3373), .B0 (B[3]), .B1 (
           nx3415), .C0 (nx4118), .C1 (nx3367)) ;
    oai21 ix4111 (.Y (nx4110), .A0 (B[0]), .A1 (nx807), .B0 (nx2611)) ;
    aoi222 ix2992 (.Y (nx2991), .A0 (nx2993), .A1 (nx3405), .B0 (B[1]), .B1 (
           nx3391), .C0 (A[2]), .C1 (nx3399)) ;
    inv01 ix2994 (.Y (nx2993), .A (B[2])) ;
    aoi21 ix2996 (.Y (nx2995), .A0 (B[2]), .A1 (nx3381), .B0 (nx4088)) ;
    oai22 ix4089 (.Y (nx4088), .A0 (nx2999), .A1 (nx3421), .B0 (nx2359), .B1 (
          nx3431)) ;
    xnor2 ix3000 (.Y (nx2999), .A0 (nx1468), .A1 (nx1460)) ;
    aoi221 ix3002 (.Y (nx3001), .A0 (nx4074), .A1 (nx3870), .B0 (nx4052), .B1 (
           nx3481), .C0 (nx4044)) ;
    ao32 ix4045 (.Y (nx4044), .A0 (nx3800), .A1 (nx3363), .A2 (nx3487), .B0 (
         nx3762), .B1 (nx3770)) ;
    nand04 ix4209 (.Y (Res1[3]), .A0 (nx3015), .A1 (nx3017), .A2 (nx3021), .A3 (
           nx3027)) ;
    aoi222 ix3016 (.Y (nx3015), .A0 (Add_Res_3), .A1 (nx3373), .B0 (B[4]), .B1 (
           nx3415), .C0 (nx160), .C1 (nx3367)) ;
    aoi222 ix3018 (.Y (nx3017), .A0 (nx3019), .A1 (nx3405), .B0 (B[2]), .B1 (
           nx3391), .C0 (A[3]), .C1 (nx3399)) ;
    inv01 ix3020 (.Y (nx3019), .A (B[3])) ;
    aoi21 ix3022 (.Y (nx3021), .A0 (B[3]), .A1 (nx3381), .B0 (nx4178)) ;
    oai22 ix4179 (.Y (nx4178), .A0 (nx3025), .A1 (nx3421), .B0 (nx2237), .B1 (
          nx3431)) ;
    xnor2 ix3026 (.Y (nx3025), .A0 (nx1472), .A1 (nx1446)) ;
    aoi221 ix3028 (.Y (nx3027), .A0 (nx4164), .A1 (nx3870), .B0 (nx4146), .B1 (
           nx3481), .C0 (nx4138)) ;
    ao32 ix4139 (.Y (nx4138), .A0 (nx3926), .A1 (nx3363), .A2 (nx3487), .B0 (
         nx3916), .B1 (nx3770)) ;
    nor04 ix4487 (.Y (nx4486), .A0 (Res1[4]), .A1 (Res1[5]), .A2 (Res1[6]), .A3 (
          Res1[7])) ;
    nand04 ix4291 (.Y (Res1[4]), .A0 (nx3041), .A1 (nx3043), .A2 (nx3047), .A3 (
           nx3053)) ;
    aoi222 ix3042 (.Y (nx3041), .A0 (Add_Res_4), .A1 (nx3373), .B0 (B[5]), .B1 (
           nx3415), .C0 (nx3814), .C1 (nx3487)) ;
    aoi222 ix3044 (.Y (nx3043), .A0 (nx3045), .A1 (nx3405), .B0 (B[3]), .B1 (
           nx3391), .C0 (A[4]), .C1 (nx3399)) ;
    inv01 ix3046 (.Y (nx3045), .A (B[4])) ;
    aoi21 ix3048 (.Y (nx3047), .A0 (B[4]), .A1 (nx3381), .B0 (nx4260)) ;
    oai22 ix4261 (.Y (nx4260), .A0 (nx3051), .A1 (nx3421), .B0 (nx2115), .B1 (
          nx3431)) ;
    xnor2 ix3052 (.Y (nx3051), .A0 (nx1476), .A1 (nx1438)) ;
    aoi222 ix3054 (.Y (nx3053), .A0 (nx3862), .A1 (nx3485), .B0 (nx4240), .B1 (
           nx36), .C0 (nx3838), .C1 (nx3481)) ;
    nand03 ix3058 (.Y (nx3057), .A0 (nx26), .A1 (Opr[0]), .A2 (nx28)) ;
    oai21 ix4225 (.Y (nx4224), .A0 (nx815), .A1 (B[0]), .B0 (nx2623)) ;
    nand04 ix4355 (.Y (Res1[5]), .A0 (nx3069), .A1 (nx3071), .A2 (nx3075), .A3 (
           nx3081)) ;
    aoi222 ix3070 (.Y (nx3069), .A0 (Add_Res_5), .A1 (nx3375), .B0 (B[6]), .B1 (
           nx3415), .C0 (nx3940), .C1 (nx3479)) ;
    aoi222 ix3072 (.Y (nx3071), .A0 (nx3073), .A1 (nx3405), .B0 (B[4]), .B1 (
           nx3391), .C0 (A[5]), .C1 (nx3399)) ;
    inv01 ix3074 (.Y (nx3073), .A (B[5])) ;
    aoi21 ix3076 (.Y (nx3075), .A0 (B[5]), .A1 (nx3381), .B0 (nx4324)) ;
    oai22 ix4325 (.Y (nx4324), .A0 (nx3079), .A1 (nx3421), .B0 (nx1993), .B1 (
          nx3431)) ;
    xnor2 ix3080 (.Y (nx3079), .A0 (nx1480), .A1 (nx1430)) ;
    aoi222 ix3082 (.Y (nx3081), .A0 (nx3980), .A1 (nx3485), .B0 (nx4308), .B1 (
           nx36), .C0 (nx3962), .C1 (nx3481)) ;
    nand04 ix4431 (.Y (Res1[6]), .A0 (nx3089), .A1 (nx3091), .A2 (nx3095), .A3 (
           nx3101)) ;
    aoi222 ix3090 (.Y (nx3089), .A0 (Add_Res_6), .A1 (nx3375), .B0 (B[7]), .B1 (
           nx3417), .C0 (nx4052), .C1 (nx3479)) ;
    aoi222 ix3092 (.Y (nx3091), .A0 (nx3093), .A1 (nx3405), .B0 (B[5]), .B1 (
           nx3393), .C0 (A[6]), .C1 (nx3401)) ;
    inv01 ix3094 (.Y (nx3093), .A (B[6])) ;
    aoi21 ix3096 (.Y (nx3095), .A0 (B[6]), .A1 (nx3383), .B0 (nx4400)) ;
    oai22 ix4401 (.Y (nx4400), .A0 (nx3099), .A1 (nx3421), .B0 (nx1871), .B1 (
          nx3431)) ;
    xnor2 ix3100 (.Y (nx3099), .A0 (nx1484), .A1 (nx1422)) ;
    aoi222 ix3102 (.Y (nx3101), .A0 (nx4070), .A1 (nx3485), .B0 (nx4384), .B1 (
           nx36), .C0 (nx4062), .C1 (nx3481)) ;
    oai21 ix4369 (.Y (nx4368), .A0 (nx823), .A1 (B[0]), .B0 (nx2635)) ;
    nand04 ix4479 (.Y (Res1[7]), .A0 (nx3111), .A1 (nx3113), .A2 (nx3117), .A3 (
           nx3123)) ;
    aoi222 ix3112 (.Y (nx3111), .A0 (Add_Res_7), .A1 (nx3375), .B0 (B[8]), .B1 (
           nx3417), .C0 (nx4146), .C1 (nx3479)) ;
    aoi222 ix3114 (.Y (nx3113), .A0 (nx3115), .A1 (nx3407), .B0 (B[6]), .B1 (
           nx3393), .C0 (A[7]), .C1 (nx3401)) ;
    inv01 ix3116 (.Y (nx3115), .A (B[7])) ;
    aoi21 ix3118 (.Y (nx3117), .A0 (B[7]), .A1 (nx3383), .B0 (nx4448)) ;
    oai22 ix4449 (.Y (nx4448), .A0 (nx3121), .A1 (nx3423), .B0 (nx1755), .B1 (
          nx3431)) ;
    xnor2 ix3122 (.Y (nx3121), .A0 (nx1488), .A1 (nx1414)) ;
    aoi222 ix3124 (.Y (nx3123), .A0 (nx1776), .A1 (nx3485), .B0 (nx164), .B1 (
           nx36), .C0 (nx4156), .C1 (nx3483)) ;
    nor04 ix4735 (.Y (nx4734), .A0 (Res1[8]), .A1 (Res1[9]), .A2 (Res1[10]), .A3 (
          Res1[11])) ;
    nand04 ix4555 (.Y (Res1[8]), .A0 (nx3129), .A1 (nx3135), .A2 (nx3139), .A3 (
           nx3145)) ;
    aoi222 ix3130 (.Y (nx3129), .A0 (Add_Res_8), .A1 (nx3375), .B0 (B[9]), .B1 (
           nx3417), .C0 (nx4540), .C1 (nx3367)) ;
    oai21 ix4533 (.Y (nx4532), .A0 (nx831), .A1 (B[0]), .B0 (nx2647)) ;
    aoi222 ix3136 (.Y (nx3135), .A0 (nx3137), .A1 (nx3407), .B0 (B[7]), .B1 (
           nx3393), .C0 (A[8]), .C1 (nx3401)) ;
    inv01 ix3138 (.Y (nx3137), .A (B[8])) ;
    aoi21 ix3140 (.Y (nx3139), .A0 (B[8]), .A1 (nx3383), .B0 (nx4510)) ;
    oai22 ix4511 (.Y (nx4510), .A0 (nx3143), .A1 (nx3423), .B0 (nx1689), .B1 (
          nx3433)) ;
    xnor2 ix3144 (.Y (nx3143), .A0 (nx1492), .A1 (nx1406)) ;
    aoi322 ix3146 (.Y (nx3145), .A0 (nx1466), .A1 (nx3441), .A2 (nx4496), .B0 (
           nx3866), .B1 (nx1782), .C0 (nx4232), .C1 (nx3475)) ;
    nand04 ix4611 (.Y (Res1[9]), .A0 (nx3153), .A1 (nx3157), .A2 (nx3161), .A3 (
           nx3167)) ;
    aoi222 ix3154 (.Y (nx3153), .A0 (Add_Res_9), .A1 (nx3375), .B0 (B[10]), .B1 (
           nx3417), .C0 (nx4596), .C1 (nx3367)) ;
    aoi222 ix3158 (.Y (nx3157), .A0 (nx3159), .A1 (nx3407), .B0 (B[8]), .B1 (
           nx3393), .C0 (A[9]), .C1 (nx3401)) ;
    inv01 ix3160 (.Y (nx3159), .A (B[9])) ;
    aoi21 ix3162 (.Y (nx3161), .A0 (B[9]), .A1 (nx3383), .B0 (nx4572)) ;
    oai22 ix4573 (.Y (nx4572), .A0 (nx3165), .A1 (nx3423), .B0 (nx1515), .B1 (
          nx3433)) ;
    xnor2 ix3166 (.Y (nx3165), .A0 (nx1496), .A1 (nx1398)) ;
    aoi222 ix3168 (.Y (nx3167), .A0 (nx4300), .A1 (nx3475), .B0 (nx3984), .B1 (
           nx1782), .C0 (nx4018), .C1 (nx4496)) ;
    nand04 ix4679 (.Y (Res1[10]), .A0 (nx3171), .A1 (nx3177), .A2 (nx3181), .A3 (
           nx3187)) ;
    aoi222 ix3172 (.Y (nx3171), .A0 (Add_Res_10), .A1 (nx3375), .B0 (B[11]), .B1 (
           nx3417), .C0 (nx4664), .C1 (nx3369)) ;
    oai21 ix4657 (.Y (nx4656), .A0 (nx839), .A1 (B[0]), .B0 (nx2659)) ;
    aoi222 ix3178 (.Y (nx3177), .A0 (nx3179), .A1 (nx3407), .B0 (B[9]), .B1 (
           nx3393), .C0 (A[10]), .C1 (nx3401)) ;
    inv01 ix3180 (.Y (nx3179), .A (B[10])) ;
    aoi21 ix3182 (.Y (nx3181), .A0 (B[10]), .A1 (nx3383), .B0 (nx4634)) ;
    oai22 ix4635 (.Y (nx4634), .A0 (nx3185), .A1 (nx3423), .B0 (nx1393), .B1 (
          nx3433)) ;
    xnor2 ix3186 (.Y (nx3185), .A0 (nx1500), .A1 (nx1390)) ;
    aoi222 ix3188 (.Y (nx3187), .A0 (nx4376), .A1 (nx3475), .B0 (nx4074), .B1 (
           nx1782), .C0 (nx4118), .C1 (nx4496)) ;
    nand04 ix4727 (.Y (Res1[11]), .A0 (nx3191), .A1 (nx3193), .A2 (nx3197), .A3 (
           nx3203)) ;
    aoi222 ix3192 (.Y (nx3191), .A0 (Add_Res_11), .A1 (nx3375), .B0 (B[12]), .B1 (
           nx3417), .C0 (nx98), .C1 (nx3369)) ;
    aoi222 ix3194 (.Y (nx3193), .A0 (nx3195), .A1 (nx3407), .B0 (B[10]), .B1 (
           nx3393), .C0 (A[11]), .C1 (nx3401)) ;
    inv01 ix3196 (.Y (nx3195), .A (B[11])) ;
    aoi21 ix3198 (.Y (nx3197), .A0 (B[11]), .A1 (nx3383), .B0 (nx4696)) ;
    oai22 ix4697 (.Y (nx4696), .A0 (nx3201), .A1 (nx3423), .B0 (nx1271), .B1 (
          nx3433)) ;
    xnor2 ix3202 (.Y (nx3201), .A0 (nx1504), .A1 (nx1382)) ;
    aoi222 ix3204 (.Y (nx3203), .A0 (nx130), .A1 (nx3475), .B0 (nx4164), .B1 (
           nx1782), .C0 (nx160), .C1 (nx4496)) ;
    nor04 ix4917 (.Y (nx4916), .A0 (Res1[12]), .A1 (Res1[13]), .A2 (Res1[14]), .A3 (
          nx3489)) ;
    nand04 ix4793 (.Y (Res1[12]), .A0 (nx3209), .A1 (nx3211), .A2 (nx3215), .A3 (
           nx3221)) ;
    aoi222 ix3210 (.Y (nx3209), .A0 (Add_Res_12), .A1 (nx3377), .B0 (B[13]), .B1 (
           nx3417), .C0 (nx3862), .C1 (nx3479)) ;
    aoi222 ix3212 (.Y (nx3211), .A0 (nx3213), .A1 (nx3407), .B0 (B[11]), .B1 (
           nx3393), .C0 (A[12]), .C1 (nx3401)) ;
    inv01 ix3214 (.Y (nx3213), .A (B[12])) ;
    aoi21 ix3216 (.Y (nx3215), .A0 (B[12]), .A1 (nx3383), .B0 (nx4762)) ;
    oai22 ix4763 (.Y (nx4762), .A0 (nx3219), .A1 (nx3423), .B0 (nx1149), .B1 (
          nx3433)) ;
    xnor2 ix3220 (.Y (nx3219), .A0 (nx1508), .A1 (nx1374)) ;
    aoi221 ix3222 (.Y (nx3221), .A0 (nx4240), .A1 (nx170), .B0 (nx4540), .B1 (
           nx3475), .C0 (nx4746)) ;
    ao32 ix4747 (.Y (nx4746), .A0 (nx4742), .A1 (nx3441), .A2 (nx3369), .B0 (
         nx4656), .B1 (nx66)) ;
    oai21 ix4743 (.Y (nx4742), .A0 (nx847), .A1 (B[0]), .B0 (nx2671)) ;
    nand04 ix4845 (.Y (Res1[13]), .A0 (nx3229), .A1 (nx3231), .A2 (nx3235), .A3 (
           nx3241)) ;
    aoi222 ix3230 (.Y (nx3229), .A0 (Add_Res_13), .A1 (nx3377), .B0 (B[14]), .B1 (
           nx3419), .C0 (nx3980), .C1 (nx3479)) ;
    aoi222 ix3232 (.Y (nx3231), .A0 (nx3233), .A1 (nx3407), .B0 (B[12]), .B1 (
           nx3395), .C0 (A[13]), .C1 (nx3403)) ;
    inv01 ix3234 (.Y (nx3233), .A (B[13])) ;
    aoi21 ix3236 (.Y (nx3235), .A0 (B[13]), .A1 (nx3385), .B0 (nx4814)) ;
    oai22 ix4815 (.Y (nx4814), .A0 (nx3239), .A1 (nx3423), .B0 (nx1021), .B1 (
          nx3433)) ;
    xnor2 ix3240 (.Y (nx3239), .A0 (nx1512), .A1 (nx1366)) ;
    aoi221 ix3242 (.Y (nx3241), .A0 (nx4308), .A1 (nx170), .B0 (nx4596), .B1 (
           nx3475), .C0 (nx4798)) ;
    ao32 ix4799 (.Y (nx4798), .A0 (nx64), .A1 (nx3441), .A2 (nx3369), .B0 (nx80)
         , .B1 (nx66)) ;
    nand04 ix4909 (.Y (Res1[14]), .A0 (nx3247), .A1 (nx3249), .A2 (nx3253), .A3 (
           nx3259)) ;
    aoi222 ix3248 (.Y (nx3247), .A0 (Add_Res_14), .A1 (nx3377), .B0 (B[15]), .B1 (
           nx3419), .C0 (nx4070), .C1 (nx3479)) ;
    aoi222 ix3250 (.Y (nx3249), .A0 (nx3251), .A1 (nx3409), .B0 (B[13]), .B1 (
           nx3395), .C0 (A[14]), .C1 (nx3403)) ;
    inv01 ix3252 (.Y (nx3251), .A (B[14])) ;
    aoi21 ix3254 (.Y (nx3253), .A0 (B[14]), .A1 (nx3385), .B0 (nx4878)) ;
    oai22 ix4879 (.Y (nx4878), .A0 (nx3257), .A1 (nx3425), .B0 (nx1003), .B1 (
          nx3433)) ;
    xnor2 ix3258 (.Y (nx3257), .A0 (nx1516), .A1 (nx1358)) ;
    aoi221 ix3260 (.Y (nx3259), .A0 (nx4384), .A1 (nx170), .B0 (nx4664), .B1 (
           nx3477), .C0 (nx4862)) ;
    ao32 ix4863 (.Y (nx4862), .A0 (nx3441), .A1 (nx3369), .A2 (nx4856), .B0 (
         nx4742), .B1 (nx66)) ;
    oai21 ix4857 (.Y (nx4856), .A0 (B[0]), .A1 (nx855), .B0 (nx2683)) ;
    nor04 ix3661 (.Y (nx3660), .A0 (nx3267), .A1 (nx3271), .A2 (nx3273), .A3 (
          nx3275)) ;
    nand04 ix3268 (.Y (nx3267), .A0 (nx2601), .A1 (nx2945), .A2 (nx3269), .A3 (
           nx3025)) ;
    nand04 ix3272 (.Y (nx3271), .A0 (nx3051), .A1 (nx3079), .A2 (nx3099), .A3 (
           nx3121)) ;
    nand04 ix3274 (.Y (nx3273), .A0 (nx3143), .A1 (nx3165), .A2 (nx3185), .A3 (
           nx3201)) ;
    nand04 ix3276 (.Y (nx3275), .A0 (nx3219), .A1 (nx3239), .A2 (nx3257), .A3 (
           nx2811)) ;
    and04 ix3687 (.Y (nx3686), .A0 (nx3279), .A1 (nx3281), .A2 (nx3283), .A3 (
          nx3285)) ;
    xnor2 ix3282 (.Y (nx3281), .A0 (nx3504), .A1 (nx3488)) ;
    xnor2 ix3284 (.Y (nx3283), .A0 (nx3508), .A1 (nx3458)) ;
    xnor2 ix3286 (.Y (nx3285), .A0 (nx3512), .A1 (nx3414)) ;
    and04 ix3709 (.Y (nx3708), .A0 (nx3289), .A1 (nx3291), .A2 (nx3293), .A3 (
          nx3295)) ;
    xnor2 ix3290 (.Y (nx3289), .A0 (nx3516), .A1 (nx3356)) ;
    xnor2 ix3292 (.Y (nx3291), .A0 (nx3520), .A1 (nx3284)) ;
    xnor2 ix3294 (.Y (nx3293), .A0 (nx3524), .A1 (nx3198)) ;
    xnor2 ix3296 (.Y (nx3295), .A0 (nx3528), .A1 (nx3098)) ;
    nor02_2x ix3753 (.Y (nx3752), .A0 (nx3299), .A1 (nx3309)) ;
    nand04 ix3300 (.Y (nx3299), .A0 (nx3301), .A1 (nx3303), .A2 (nx3305), .A3 (
           nx3307)) ;
    xnor2 ix3302 (.Y (nx3301), .A0 (nx3532), .A1 (nx2984)) ;
    xnor2 ix3304 (.Y (nx3303), .A0 (nx3536), .A1 (nx2856)) ;
    xnor2 ix3306 (.Y (nx3305), .A0 (nx3540), .A1 (nx2714)) ;
    xnor2 ix3308 (.Y (nx3307), .A0 (nx3544), .A1 (nx2558)) ;
    nand04 ix3310 (.Y (nx3309), .A0 (nx3311), .A1 (nx3313), .A2 (nx3315), .A3 (
           nx3489)) ;
    xnor2 ix3312 (.Y (nx3311), .A0 (nx3548), .A1 (nx2388)) ;
    xnor2 ix3314 (.Y (nx3313), .A0 (nx3552), .A1 (nx2204)) ;
    xnor2 ix3316 (.Y (nx3315), .A0 (nx3556), .A1 (nx2006)) ;
    nand02 ix5071 (.Y (Flags[2]), .A0 (nx3319), .A1 (nx3321)) ;
    aoi32 ix3320 (.Y (nx3319), .A0 (nx2763), .A1 (Opr[0]), .A2 (nx2757), .B0 (
          Add_Cout), .B1 (nx3377)) ;
    aoi22 ix3322 (.Y (nx3321), .A0 (B[0]), .A1 (nx3419), .B0 (B[15]), .B1 (
          nx3395)) ;
    xnor2 ix3667 (.Y (nx3666), .A0 (nx3500), .A1 (nx2427)) ;
    inv01 ix3871 (.Y (nx3870), .A (nx3057)) ;
    inv01 ix3771 (.Y (nx3770), .A (nx2921)) ;
    inv01 ix3280 (.Y (nx3279), .A (nx3666)) ;
    inv01 ix1933 (.Y (nx1932), .A (nx915)) ;
    inv01 ix1923 (.Y (nx1922), .A (nx923)) ;
    inv01 ix1913 (.Y (nx1912), .A (nx931)) ;
    inv01 ix1903 (.Y (nx1902), .A (nx939)) ;
    inv01 ix1893 (.Y (nx1892), .A (nx947)) ;
    inv01 ix1883 (.Y (nx1882), .A (nx955)) ;
    inv01 ix1873 (.Y (nx1872), .A (nx963)) ;
    inv01 ix1863 (.Y (nx1862), .A (nx971)) ;
    inv01 ix1853 (.Y (nx1852), .A (nx979)) ;
    inv01 ix1843 (.Y (nx1842), .A (nx987)) ;
    inv01 ix1833 (.Y (nx1832), .A (nx995)) ;
    inv01 ix1823 (.Y (nx1822), .A (nx1003)) ;
    inv01 ix1813 (.Y (nx1812), .A (nx1009)) ;
    inv01 ix1783 (.Y (nx1782), .A (nx2775)) ;
    inv01 ix2924 (.Y (nx2923), .A (nx1764)) ;
    inv01 ix1723 (.Y (nx1722), .A (nx2749)) ;
    inv01 ix1467 (.Y (nx1466), .A (nx2601)) ;
    inv01 ix3270 (.Y (nx3269), .A (nx1460)) ;
    inv01 ix1143 (.Y (nx1142), .A (nx2603)) ;
    inv01 ix207 (.Y (nx206), .A (nx2683)) ;
    inv01 ix193 (.Y (nx192), .A (nx2761)) ;
    inv01 ix139 (.Y (nx138), .A (nx2611)) ;
    inv01 ix137 (.Y (nx136), .A (nx2617)) ;
    inv01 ix121 (.Y (nx120), .A (nx2623)) ;
    inv01 ix119 (.Y (nx118), .A (nx2629)) ;
    inv01 ix107 (.Y (nx106), .A (nx2635)) ;
    inv01 ix105 (.Y (nx104), .A (nx2641)) ;
    inv01 ix89 (.Y (nx88), .A (nx2647)) ;
    inv01 ix87 (.Y (nx86), .A (nx2653)) ;
    inv01 ix75 (.Y (nx74), .A (nx2659)) ;
    inv01 ix73 (.Y (nx72), .A (nx2665)) ;
    inv01 ix59 (.Y (nx58), .A (nx2671)) ;
    inv01 ix57 (.Y (nx56), .A (nx2677)) ;
    inv01 ix47 (.Y (nx46), .A (nx2689)) ;
    inv01 ix2784 (.Y (nx2783), .A (nx28)) ;
    inv01 ix27 (.Y (nx26), .A (nx2845)) ;
    inv02 ix15 (.Y (nx14), .A (nx2839)) ;
    inv01 ix1 (.Y (nx0), .A (nx2773)) ;
    inv02 ix3361 (.Y (nx3363), .A (nx3443)) ;
    inv02 ix3366 (.Y (nx3367), .A (nx2871)) ;
    inv02 ix3368 (.Y (nx3369), .A (nx2871)) ;
    inv02 ix3372 (.Y (nx3373), .A (nx3371)) ;
    inv02 ix3374 (.Y (nx3375), .A (nx3371)) ;
    inv02 ix3376 (.Y (nx3377), .A (nx3371)) ;
    inv01 ix3378 (.Y (nx3379), .A (nx202)) ;
    inv02 ix3380 (.Y (nx3381), .A (nx3379)) ;
    inv02 ix3382 (.Y (nx3383), .A (nx3379)) ;
    inv02 ix3384 (.Y (nx3385), .A (nx3379)) ;
    inv02 ix3390 (.Y (nx3391), .A (nx3389)) ;
    inv02 ix3392 (.Y (nx3393), .A (nx3389)) ;
    inv02 ix3394 (.Y (nx3395), .A (nx3389)) ;
    inv01 ix3396 (.Y (nx3397), .A (nx1760)) ;
    inv02 ix3398 (.Y (nx3399), .A (nx3397)) ;
    inv02 ix3400 (.Y (nx3401), .A (nx3397)) ;
    inv02 ix3402 (.Y (nx3403), .A (nx3397)) ;
    inv02 ix3404 (.Y (nx3405), .A (nx2923)) ;
    inv02 ix3406 (.Y (nx3407), .A (nx2923)) ;
    inv02 ix3408 (.Y (nx3409), .A (nx2923)) ;
    inv01 ix3412 (.Y (nx3413), .A (nx1794)) ;
    inv02 ix3414 (.Y (nx3415), .A (nx3413)) ;
    inv02 ix3416 (.Y (nx3417), .A (nx3413)) ;
    inv02 ix3418 (.Y (nx3419), .A (nx3413)) ;
    inv02 ix3420 (.Y (nx3421), .A (nx3489)) ;
    inv02 ix3422 (.Y (nx3423), .A (nx3489)) ;
    inv02 ix3424 (.Y (nx3425), .A (nx3489)) ;
    inv02 ix3430 (.Y (nx3431), .A (nx1730)) ;
    inv02 ix3432 (.Y (nx3433), .A (nx1730)) ;
    inv02 ix3434 (.Y (nx3435), .A (nx3465)) ;
    inv02 ix3436 (.Y (nx3437), .A (nx3465)) ;
    inv02 ix3440 (.Y (nx3441), .A (nx3465)) ;
    inv02 ix3442 (.Y (nx3443), .A (nx3465)) ;
    inv02 ix3444 (.Y (nx3445), .A (nx3473)) ;
    inv02 ix3452 (.Y (nx3453), .A (nx2813)) ;
    inv02 ix3454 (.Y (nx3455), .A (nx2813)) ;
    nor02ii ix5075 (.Y (Add_Opr_2_0), .A0 (Opr[1]), .A1 (A[0])) ;
    nor02ii ix5079 (.Y (Add_Opr_2_1), .A0 (Opr[1]), .A1 (A[1])) ;
    nor02ii ix5083 (.Y (Add_Opr_2_2), .A0 (Opr[1]), .A1 (A[2])) ;
    nor02ii ix5087 (.Y (Add_Opr_2_3), .A0 (Opr[1]), .A1 (A[3])) ;
    nor02ii ix5091 (.Y (Add_Opr_2_4), .A0 (Opr[1]), .A1 (A[4])) ;
    nor02ii ix5095 (.Y (Add_Opr_2_5), .A0 (Opr[1]), .A1 (A[5])) ;
    nor02ii ix5099 (.Y (Add_Opr_2_6), .A0 (Opr[1]), .A1 (A[6])) ;
    nor02ii ix5103 (.Y (Add_Opr_2_7), .A0 (Opr[1]), .A1 (A[7])) ;
    nor02ii ix5107 (.Y (Add_Opr_2_8), .A0 (Opr[1]), .A1 (A[8])) ;
    nor02ii ix5111 (.Y (Add_Opr_2_9), .A0 (Opr[1]), .A1 (A[9])) ;
    nor02ii ix5115 (.Y (Add_Opr_2_10), .A0 (Opr[1]), .A1 (A[10])) ;
    nor02ii ix5119 (.Y (Add_Opr_2_11), .A0 (Opr[1]), .A1 (A[11])) ;
    nor02ii ix5123 (.Y (Add_Opr_2_12), .A0 (Opr[1]), .A1 (A[12])) ;
    nor02ii ix5127 (.Y (Add_Opr_2_13), .A0 (Opr[1]), .A1 (A[13])) ;
    nor02ii ix5131 (.Y (Add_Opr_2_14), .A0 (Opr[1]), .A1 (A[14])) ;
    nor02ii ix5135 (.Y (Add_Opr_2_15), .A0 (Opr[1]), .A1 (A[15])) ;
    mux21_ni ix3565 (.Y (Flags[1]), .A0 (Res1[15]), .A1 (nx3560), .S0 (nx3489)
             ) ;
    and02 ix221 (.Y (nx220), .A0 (A[0]), .A1 (A[1])) ;
    or02 ix181 (.Y (nx3371), .A0 (Opr[3]), .A1 (nx2757)) ;
    nor02ii ix2762 (.Y (nx2761), .A0 (Opr[1]), .A1 (Opr[3])) ;
    nor02ii ix1777 (.Y (nx1776), .A0 (nx2689), .A1 (nx3443)) ;
    nor02ii ix1787 (.Y (nx1786), .A0 (nx2775), .A1 (nx2839)) ;
    nand03 ix1747 (.Y (nx3389), .A0 (nx2761), .A1 (nx3462), .A2 (Opr[2])) ;
    inv01 ix3461 (.Y (nx3462), .A (Opr[0])) ;
    and03 ix2818 (.Y (nx1730), .A0 (nx2761), .A1 (Opr[0]), .A2 (nx2757)) ;
    mux21_ni ix165 (.Y (nx164), .A0 (nx130), .A1 (nx160), .S0 (nx3473)) ;
    mux21_ni ix161 (.Y (nx160), .A0 (nx144), .A1 (nx156), .S0 (nx3465)) ;
    mux21_ni ix131 (.Y (nx130), .A0 (nx112), .A1 (nx126), .S0 (nx3465)) ;
    mux21_ni ix99 (.Y (nx98), .A0 (nx80), .A1 (nx94), .S0 (nx3465)) ;
    and02 ix101 (.Y (nx100), .A0 (nx3473), .A1 (nx36)) ;
    nor02ii ix67 (.Y (nx66), .A0 (nx2871), .A1 (nx3467)) ;
    mux21_ni ix3867 (.Y (nx3866), .A0 (nx3838), .A1 (nx3862), .S0 (nx3473)) ;
    mux21_ni ix3863 (.Y (nx3862), .A0 (nx3848), .A1 (nx3858), .S0 (nx3467)) ;
    mux21_ni ix3839 (.Y (nx3838), .A0 (nx3824), .A1 (nx3834), .S0 (nx3467)) ;
    mux21_ni ix3815 (.Y (nx3814), .A0 (nx3800), .A1 (nx3810), .S0 (nx3467)) ;
    nor02ii ix3817 (.Y (nx3816), .A0 (nx2775), .A1 (nx3473)) ;
    and02 ix4019 (.Y (nx4018), .A0 (nx3443), .A1 (nx156)) ;
    mux21_ni ix3985 (.Y (nx3984), .A0 (nx3962), .A1 (nx3980), .S0 (nx3473)) ;
    mux21_ni ix3981 (.Y (nx3980), .A0 (nx3972), .A1 (nx46), .S0 (nx3467)) ;
    mux21_ni ix3963 (.Y (nx3962), .A0 (nx3948), .A1 (nx3958), .S0 (nx3467)) ;
    mux21_ni ix3941 (.Y (nx3940), .A0 (nx3926), .A1 (nx3936), .S0 (nx3467)) ;
    mux21_ni ix4119 (.Y (nx4118), .A0 (nx4110), .A1 (nx1466), .S0 (nx3469)) ;
    mux21_ni ix4075 (.Y (nx4074), .A0 (nx4062), .A1 (nx4070), .S0 (nx3473)) ;
    and02 ix4071 (.Y (nx4070), .A0 (nx3443), .A1 (nx3858)) ;
    mux21_ni ix4063 (.Y (nx4062), .A0 (nx3834), .A1 (nx3848), .S0 (nx3469)) ;
    mux21_ni ix4053 (.Y (nx4052), .A0 (nx3810), .A1 (nx3824), .S0 (nx3469)) ;
    mux21_ni ix4165 (.Y (nx4164), .A0 (nx4156), .A1 (nx1776), .S0 (nx14)) ;
    mux21_ni ix4157 (.Y (nx4156), .A0 (nx3958), .A1 (nx3972), .S0 (nx3469)) ;
    mux21_ni ix4147 (.Y (nx4146), .A0 (nx3936), .A1 (nx3948), .S0 (nx3469)) ;
    nor02ii ix4247 (.Y (nx4246), .A0 (nx3057), .A1 (nx2839)) ;
    mux21_ni ix4241 (.Y (nx4240), .A0 (nx4232), .A1 (nx3894), .S0 (nx14)) ;
    nor02ii ix3895 (.Y (nx3894), .A0 (nx2601), .A1 (nx3443)) ;
    mux21_ni ix4233 (.Y (nx4232), .A0 (nx4224), .A1 (nx4110), .S0 (nx3469)) ;
    mux21_ni ix4309 (.Y (nx4308), .A0 (nx4300), .A1 (nx4018), .S0 (nx14)) ;
    mux21_ni ix4301 (.Y (nx4300), .A0 (nx126), .A1 (nx144), .S0 (nx3469)) ;
    mux21_ni ix4385 (.Y (nx4384), .A0 (nx4376), .A1 (nx4118), .S0 (nx14)) ;
    mux21_ni ix4377 (.Y (nx4376), .A0 (nx4368), .A1 (nx4224), .S0 (nx3471)) ;
    mux21_ni ix4541 (.Y (nx4540), .A0 (nx4532), .A1 (nx4368), .S0 (nx3471)) ;
    and02 ix4497 (.Y (nx4496), .A0 (nx2839), .A1 (nx170)) ;
    mux21_ni ix4597 (.Y (nx4596), .A0 (nx94), .A1 (nx112), .S0 (nx3471)) ;
    mux21_ni ix4665 (.Y (nx4664), .A0 (nx4656), .A1 (nx4532), .S0 (nx3471)) ;
    mux21_ni ix4935 (.Y (Res2[0]), .A0 (A[0]), .A1 (nx3666), .S0 (nx3491)) ;
    mux21 ix4943 (.Y (Res2[1]), .A0 (nx807), .A1 (nx3281), .S0 (nx3491)) ;
    mux21 ix4951 (.Y (Res2[2]), .A0 (nx811), .A1 (nx3283), .S0 (nx3491)) ;
    mux21 ix4959 (.Y (Res2[3]), .A0 (nx815), .A1 (nx3285), .S0 (nx3491)) ;
    mux21 ix4967 (.Y (Res2[4]), .A0 (nx819), .A1 (nx3289), .S0 (nx3491)) ;
    mux21 ix4975 (.Y (Res2[5]), .A0 (nx823), .A1 (nx3291), .S0 (nx3491)) ;
    mux21 ix4983 (.Y (Res2[6]), .A0 (nx827), .A1 (nx3293), .S0 (nx3491)) ;
    mux21 ix4991 (.Y (Res2[7]), .A0 (nx831), .A1 (nx3295), .S0 (nx3453)) ;
    mux21 ix4999 (.Y (Res2[8]), .A0 (nx835), .A1 (nx3301), .S0 (nx3453)) ;
    mux21 ix5007 (.Y (Res2[9]), .A0 (nx839), .A1 (nx3303), .S0 (nx3453)) ;
    mux21 ix5015 (.Y (Res2[10]), .A0 (nx843), .A1 (nx3305), .S0 (nx3453)) ;
    mux21 ix5023 (.Y (Res2[11]), .A0 (nx847), .A1 (nx3307), .S0 (nx3453)) ;
    mux21 ix5031 (.Y (Res2[12]), .A0 (nx851), .A1 (nx3311), .S0 (nx3453)) ;
    mux21 ix5039 (.Y (Res2[13]), .A0 (nx855), .A1 (nx3313), .S0 (nx3455)) ;
    mux21 ix5047 (.Y (Res2[14]), .A0 (nx859), .A1 (nx3315), .S0 (nx3455)) ;
    mux21_ni ix5055 (.Y (Res2[15]), .A0 (A[15]), .A1 (nx3560), .S0 (nx3455)) ;
    and02 ix3386 (.Y (nx3387), .A0 (A[0]), .A1 (A[1])) ;
    nor02ii ix3410 (.Y (nx3411), .A0 (nx2775), .A1 (nx2839)) ;
    inv02 ix3463 (.Y (nx3465), .A (nx2831)) ;
    inv02 ix3466 (.Y (nx3467), .A (nx2831)) ;
    inv02 ix3468 (.Y (nx3469), .A (nx2831)) ;
    inv02 ix3470 (.Y (nx3471), .A (nx2831)) ;
    inv02 ix3472 (.Y (nx3473), .A (nx2839)) ;
    buf02 ix3474 (.Y (nx3475), .A (nx100)) ;
    buf02 ix3476 (.Y (nx3477), .A (nx100)) ;
    buf02 ix3478 (.Y (nx3479), .A (nx1786)) ;
    buf02 ix3480 (.Y (nx3481), .A (nx3816)) ;
    buf02 ix3482 (.Y (nx3483), .A (nx3816)) ;
    buf02 ix3484 (.Y (nx3485), .A (nx4246)) ;
    buf02 ix3486 (.Y (nx3487), .A (nx3411)) ;
    inv02 ix3488 (.Y (nx3489), .A (nx2813)) ;
    inv02 ix3490 (.Y (nx3491), .A (nx2813)) ;
endmodule


module adder_subtractor_16 ( A, B, Cin, Subtract, Sum, Cout ) ;

    input [15:0]A ;
    input [15:0]B ;
    input Cin ;
    input Subtract ;
    output [15:0]Sum ;
    output Cout ;




endmodule

