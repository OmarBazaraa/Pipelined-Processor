//
// Verilog description for cell hazard_unit, 
// Sat May  5 04:08:26 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module hazard_unit ( RESET, INTR, Rsrc, Rsrc_WB, Rsrc_Load, Rsrc_Data, Rdst, 
                     Rdst_WB, Rdst_Load, Rdst_Data, Immediate_Load, 
                     Immediate_Val, Shift_Load, Shift_Val, PC_Flags_Save, 
                     PC_Fetching, PC_To_Store, PC_Reset, PC_INTR, Flags, 
                     Mem_Addr_Switch, Mem_EA_Load, Mem_EA, Port_In_RD, 
                     Port_In_Data, Branch_Taken, DEC_Ctrl, EXE_Src, EXE_Dst, 
                     EXE_Ctrl, MEM_Src, MEM_Dst, MEM_Ctrl, WRB_Src, WRB_Dst, 
                     WRB_Ctrl, Src_Dout, Dst_Dout, PC_Next, Stall, Flush, 
                     INTR_Stall, RESET_Stall ) ;

    input RESET ;
    input INTR ;
    input [2:0]Rsrc ;
    input Rsrc_WB ;
    input Rsrc_Load ;
    input [15:0]Rsrc_Data ;
    input [2:0]Rdst ;
    input Rdst_WB ;
    input Rdst_Load ;
    input [15:0]Rdst_Data ;
    input Immediate_Load ;
    input [15:0]Immediate_Val ;
    input Shift_Load ;
    input [3:0]Shift_Val ;
    input PC_Flags_Save ;
    input [9:0]PC_Fetching ;
    input [9:0]PC_To_Store ;
    input [9:0]PC_Reset ;
    input [9:0]PC_INTR ;
    input [3:0]Flags ;
    input Mem_Addr_Switch ;
    input Mem_EA_Load ;
    input [9:0]Mem_EA ;
    input Port_In_RD ;
    input [15:0]Port_In_Data ;
    input Branch_Taken ;
    input [9:0]DEC_Ctrl ;
    input [19:0]EXE_Src ;
    input [19:0]EXE_Dst ;
    input [9:0]EXE_Ctrl ;
    input [19:0]MEM_Src ;
    input [19:0]MEM_Dst ;
    input [4:0]MEM_Ctrl ;
    input [19:0]WRB_Src ;
    input [19:0]WRB_Dst ;
    input [1:0]WRB_Ctrl ;
    output [19:0]Src_Dout ;
    output [19:0]Dst_Dout ;
    output [9:0]PC_Next ;
    output Stall ;
    output Flush ;
    output INTR_Stall ;
    output RESET_Stall ;

    wire nx40, nx76, nx106, nx114, nx124, nx130, nx152, nx176, nx200, nx224, 
         nx248, nx262, nx282, nx314, nx346, nx374, nx402, nx430, nx458, nx486, 
         nx498, nx518, nx548, nx584, nx590, nx592, nx646, nx656, nx684, nx706, 
         nx738, nx770, nx802, nx834, nx866, nx898, nx930, nx962, nx972, nx976, 
         nx982, nx986, nx994, nx1160, nx1168, nx1174, nx1180, nx1196, nx1210, 
         nx1236, nx1262, nx1288, nx1290, nx1314, nx1340, nx1342, nx1366, nx1392, 
         nx1394, nx1456, nx1462, nx1476, nx1478, nx1484, nx1502, nx1518, nx1532, 
         nx1546, nx1548, nx1562, nx1568, nx1646, nx1623, nx1627, nx1637, nx1639, 
         nx1641, nx1645, nx1651, nx1654, nx1656, nx1658, nx1661, nx1663, nx1665, 
         nx1667, nx1669, nx1671, nx1673, nx1675, nx1677, nx1679, nx1681, nx1685, 
         nx1687, nx1689, nx1691, nx1698, nx1701, nx1703, nx1706, nx1709, nx1711, 
         nx1714, nx1717, nx1719, nx1721, nx1724, nx1727, nx1729, nx1732, nx1735, 
         nx1737, nx1740, nx1742, nx1745, nx1748, nx1750, nx1753, nx1755, nx1758, 
         nx1760, nx1765, nx1767, nx1770, nx1772, nx1775, nx1777, nx1781, nx1784, 
         nx1789, nx1794, nx1796, nx1798, nx1800, nx1802, nx1804, nx1806, nx1809, 
         nx1811, nx1813, nx1815, nx1817, nx1820, nx1822, nx1825, nx1827, nx1829, 
         nx1832, nx1834, nx1836, nx1838, nx1841, nx1844, nx1846, nx1848, nx1850, 
         nx1852, nx1854, nx1857, nx1859, nx1861, nx1863, nx1868, nx1871, nx1877, 
         nx1880, nx1882, nx1884, nx1887, nx1891, nx1894, nx1896, nx1898, nx1901, 
         nx1903, nx1906, nx1909, nx1911, nx1913, nx1916, nx1918, nx1921, nx1924, 
         nx1926, nx1928, nx1931, nx1933, nx1937, nx1940, nx1942, nx1944, nx1948, 
         nx1951, nx1954, nx1956, nx1958, nx1961, nx1963, nx1967, nx1970, nx1972, 
         nx1974, nx1978, nx1981, nx1984, nx1986, nx1988, nx1991, nx1993, nx1997, 
         nx2000, nx2002, nx2005, nx2008, nx2013, nx2018, nx2021, nx2023, nx2027, 
         nx2029, nx2033, nx2035, nx2039, nx2041, nx2045, nx2047, nx2051, nx2053, 
         nx2056, nx2059, nx2062, nx2066, nx2069, nx2071, nx2074, nx2076, nx2079, 
         nx2081, nx2084, nx2086, nx2089, nx2091, nx2094, nx2096, nx2099, nx2101, 
         nx2104, nx2106, nx2109, nx2112, nx2114, nx2117, nx2119, nx2122, nx2124, 
         nx2126, nx2129, nx2132, nx2134, nx2138, nx2141, nx2143, nx2145, nx2147, 
         nx2150, nx2152, nx2154, nx2156, nx2159, nx2161, nx2163, nx2165, nx2168, 
         nx2170, nx2172, nx2175, nx2177, nx2179, nx2186, nx2188, nx2190, nx2192, 
         nx2194, nx2196, nx2198, nx2200, nx2202, nx2204, nx2206, nx2208, nx2210, 
         nx2212, nx2214, nx2216, nx2218, nx2220, nx2222, nx2224, nx2226, nx2228, 
         nx2230, nx2232, nx2234, nx2236, nx2238, nx2240, nx2242, nx2244, nx2246, 
         nx2248, nx2250, nx2252, nx2254, nx2256, nx2258, nx2260, nx2262, nx2264, 
         nx2266, nx2268, nx2270, nx2272, nx2274, nx2276, nx2278, nx2284, nx2286;



    assign Src_Dout[19] = Rsrc_WB ;
    assign Src_Dout[18] = Rsrc[2] ;
    assign Src_Dout[17] = Rsrc[1] ;
    assign Src_Dout[16] = Rsrc[0] ;
    assign Dst_Dout[19] = Rdst_WB ;
    assign Dst_Dout[18] = Rdst[2] ;
    assign Dst_Dout[17] = Rdst[1] ;
    assign Dst_Dout[16] = Rdst[0] ;
    aoi44 ix1624 (.Y (nx1623), .A0 (nx1456), .A1 (EXE_Ctrl[2]), .A2 (nx1462), .A3 (
          nx1484), .B0 (DEC_Ctrl[2]), .B1 (nx1639), .B2 (nx2278), .B3 (nx1770)
          ) ;
    nor04 ix1457 (.Y (nx1456), .A0 (EXE_Dst[7]), .A1 (EXE_Dst[9]), .A2 (
          EXE_Dst[8]), .A3 (nx1627)) ;
    or03 ix1628 (.Y (nx1627), .A0 (EXE_Dst[4]), .A1 (EXE_Dst[6]), .A2 (
         EXE_Dst[5])) ;
    nor02_2x ix1463 (.Y (nx1462), .A0 (EXE_Dst[3]), .A1 (EXE_Dst[2])) ;
    nor02_2x ix1485 (.Y (nx1484), .A0 (EXE_Dst[1]), .A1 (nx1478)) ;
    xnor2 ix1479 (.Y (nx1478), .A0 (EXE_Dst[0]), .A1 (nx1476)) ;
    nand04 ix1477 (.Y (nx1476), .A0 (nx1637), .A1 (EXE_Ctrl[8]), .A2 (
           EXE_Ctrl[7]), .A3 (EXE_Ctrl[6])) ;
    inv01 ix1638 (.Y (nx1637), .A (EXE_Ctrl[9])) ;
    inv01 ix495 (.Y (Dst_Dout[9]), .A (nx1645)) ;
    aoi222 ix1646 (.Y (nx1645), .A0 (Port_In_Data[9]), .A1 (nx2228), .B0 (
           Mem_EA_Load), .B1 (Mem_EA[9]), .C0 (nx486), .C1 (nx2222)) ;
    nor02ii ix131 (.Y (nx130), .A0 (Mem_EA_Load), .A1 (Port_In_RD)) ;
    nand02 ix487 (.Y (nx486), .A0 (nx1651), .A1 (nx1681)) ;
    aoi22 ix1652 (.Y (nx1651), .A0 (MEM_Src[9]), .A1 (nx2186), .B0 (WRB_Src[9])
          , .B1 (nx2216)) ;
    xnor2 ix1655 (.Y (nx1654), .A0 (Rdst[2]), .A1 (MEM_Src[18])) ;
    xnor2 ix1657 (.Y (nx1656), .A0 (Rdst[0]), .A1 (MEM_Src[16])) ;
    xnor2 ix1659 (.Y (nx1658), .A0 (Rdst[1]), .A1 (MEM_Src[17])) ;
    nor02_2x ix107 (.Y (nx106), .A0 (nx1661), .A1 (nx1669)) ;
    nand04 ix1662 (.Y (nx1661), .A0 (WRB_Src[19]), .A1 (nx1663), .A2 (nx1665), .A3 (
           nx1667)) ;
    xnor2 ix1664 (.Y (nx1663), .A0 (Rdst[2]), .A1 (WRB_Src[18])) ;
    xnor2 ix1666 (.Y (nx1665), .A0 (Rdst[0]), .A1 (WRB_Src[16])) ;
    xnor2 ix1668 (.Y (nx1667), .A0 (Rdst[1]), .A1 (WRB_Src[17])) ;
    nand02 ix1670 (.Y (nx1669), .A0 (nx1671), .A1 (nx1679)) ;
    nand04 ix1672 (.Y (nx1671), .A0 (MEM_Dst[19]), .A1 (nx1673), .A2 (nx1675), .A3 (
           nx1677)) ;
    xnor2 ix1674 (.Y (nx1673), .A0 (Rdst[2]), .A1 (MEM_Dst[18])) ;
    xnor2 ix1676 (.Y (nx1675), .A0 (Rdst[0]), .A1 (MEM_Dst[16])) ;
    xnor2 ix1678 (.Y (nx1677), .A0 (Rdst[1]), .A1 (MEM_Dst[17])) ;
    nand04 ix1680 (.Y (nx1679), .A0 (MEM_Src[19]), .A1 (nx1654), .A2 (nx1656), .A3 (
           nx1658)) ;
    aoi222 ix1682 (.Y (nx1681), .A0 (MEM_Dst[9]), .A1 (nx2202), .B0 (WRB_Dst[9])
           , .B1 (nx2210), .C0 (Rdst_Data[9]), .C1 (nx2194)) ;
    nand04 ix1686 (.Y (nx1685), .A0 (WRB_Dst[19]), .A1 (nx1687), .A2 (nx1689), .A3 (
           nx1691)) ;
    xnor2 ix1688 (.Y (nx1687), .A0 (Rdst[2]), .A1 (WRB_Dst[18])) ;
    xnor2 ix1690 (.Y (nx1689), .A0 (Rdst[0]), .A1 (WRB_Dst[16])) ;
    xnor2 ix1692 (.Y (nx1691), .A0 (Rdst[1]), .A1 (WRB_Dst[17])) ;
    nor03_2x ix125 (.Y (nx124), .A0 (Port_In_RD), .A1 (Shift_Load), .A2 (
             Mem_EA_Load)) ;
    inv01 ix467 (.Y (Dst_Dout[8]), .A (nx1698)) ;
    aoi222 ix1699 (.Y (nx1698), .A0 (Port_In_Data[8]), .A1 (nx2228), .B0 (
           Mem_EA[8]), .B1 (Mem_EA_Load), .C0 (nx458), .C1 (nx2222)) ;
    nand02 ix459 (.Y (nx458), .A0 (nx1701), .A1 (nx1703)) ;
    aoi22 ix1702 (.Y (nx1701), .A0 (MEM_Src[8]), .A1 (nx2186), .B0 (WRB_Src[8])
          , .B1 (nx2216)) ;
    aoi222 ix1704 (.Y (nx1703), .A0 (MEM_Dst[8]), .A1 (nx2202), .B0 (WRB_Dst[8])
           , .B1 (nx2210), .C0 (Rdst_Data[8]), .C1 (nx2194)) ;
    inv01 ix439 (.Y (Dst_Dout[7]), .A (nx1706)) ;
    aoi222 ix1707 (.Y (nx1706), .A0 (Port_In_Data[7]), .A1 (nx2228), .B0 (
           Mem_EA[7]), .B1 (Mem_EA_Load), .C0 (nx430), .C1 (nx2222)) ;
    nand02 ix431 (.Y (nx430), .A0 (nx1709), .A1 (nx1711)) ;
    aoi22 ix1710 (.Y (nx1709), .A0 (MEM_Src[7]), .A1 (nx2186), .B0 (WRB_Src[7])
          , .B1 (nx2216)) ;
    aoi222 ix1712 (.Y (nx1711), .A0 (MEM_Dst[7]), .A1 (nx2202), .B0 (WRB_Dst[7])
           , .B1 (nx2210), .C0 (Rdst_Data[7]), .C1 (nx2194)) ;
    inv01 ix411 (.Y (Dst_Dout[6]), .A (nx1714)) ;
    aoi222 ix1715 (.Y (nx1714), .A0 (Port_In_Data[6]), .A1 (nx2228), .B0 (
           Mem_EA[6]), .B1 (Mem_EA_Load), .C0 (nx402), .C1 (nx2222)) ;
    nand02 ix403 (.Y (nx402), .A0 (nx1717), .A1 (nx1719)) ;
    aoi22 ix1718 (.Y (nx1717), .A0 (MEM_Src[6]), .A1 (nx2186), .B0 (WRB_Src[6])
          , .B1 (nx2216)) ;
    aoi222 ix1720 (.Y (nx1719), .A0 (MEM_Dst[6]), .A1 (nx2202), .B0 (WRB_Dst[6])
           , .B1 (nx2210), .C0 (Rdst_Data[6]), .C1 (nx2194)) ;
    nor04 ix1722 (.Y (nx1721), .A0 (Dst_Dout[5]), .A1 (Dst_Dout[4]), .A2 (
          Dst_Dout[3]), .A3 (Dst_Dout[2])) ;
    inv01 ix383 (.Y (Dst_Dout[5]), .A (nx1724)) ;
    aoi222 ix1725 (.Y (nx1724), .A0 (Port_In_Data[5]), .A1 (nx2228), .B0 (
           Mem_EA[5]), .B1 (Mem_EA_Load), .C0 (nx374), .C1 (nx2222)) ;
    nand02 ix375 (.Y (nx374), .A0 (nx1727), .A1 (nx1729)) ;
    aoi22 ix1728 (.Y (nx1727), .A0 (MEM_Src[5]), .A1 (nx2186), .B0 (WRB_Src[5])
          , .B1 (nx2216)) ;
    aoi222 ix1730 (.Y (nx1729), .A0 (MEM_Dst[5]), .A1 (nx2202), .B0 (WRB_Dst[5])
           , .B1 (nx2210), .C0 (Rdst_Data[5]), .C1 (nx2194)) ;
    inv01 ix355 (.Y (Dst_Dout[4]), .A (nx1732)) ;
    aoi222 ix1733 (.Y (nx1732), .A0 (Port_In_Data[4]), .A1 (nx2228), .B0 (
           Mem_EA[4]), .B1 (Mem_EA_Load), .C0 (nx346), .C1 (nx2222)) ;
    nand02 ix347 (.Y (nx346), .A0 (nx1735), .A1 (nx1737)) ;
    aoi22 ix1736 (.Y (nx1735), .A0 (MEM_Src[4]), .A1 (nx2186), .B0 (WRB_Src[4])
          , .B1 (nx2216)) ;
    aoi222 ix1738 (.Y (nx1737), .A0 (MEM_Dst[4]), .A1 (nx2202), .B0 (WRB_Dst[4])
           , .B1 (nx2210), .C0 (Rdst_Data[4]), .C1 (nx2194)) ;
    nand02 ix327 (.Y (Dst_Dout[3]), .A0 (nx1740), .A1 (nx1742)) ;
    aoi22 ix1741 (.Y (nx1740), .A0 (Mem_EA[3]), .A1 (Mem_EA_Load), .B0 (
          Port_In_Data[3]), .B1 (nx2228)) ;
    aoi22 ix1743 (.Y (nx1742), .A0 (Shift_Val[3]), .A1 (nx262), .B0 (nx314), .B1 (
          nx2222)) ;
    nor03_2x ix263 (.Y (nx262), .A0 (Port_In_RD), .A1 (nx1745), .A2 (Mem_EA_Load
             )) ;
    inv01 ix1746 (.Y (nx1745), .A (Shift_Load)) ;
    nand02 ix315 (.Y (nx314), .A0 (nx1748), .A1 (nx1750)) ;
    aoi22 ix1749 (.Y (nx1748), .A0 (MEM_Src[3]), .A1 (nx2188), .B0 (WRB_Src[3])
          , .B1 (nx2216)) ;
    aoi222 ix1751 (.Y (nx1750), .A0 (MEM_Dst[3]), .A1 (nx2202), .B0 (WRB_Dst[3])
           , .B1 (nx2210), .C0 (Rdst_Data[3]), .C1 (nx2194)) ;
    nand02 ix295 (.Y (Dst_Dout[2]), .A0 (nx1753), .A1 (nx1755)) ;
    aoi22 ix1754 (.Y (nx1753), .A0 (Mem_EA[2]), .A1 (Mem_EA_Load), .B0 (
          Port_In_Data[2]), .B1 (nx2230)) ;
    aoi22 ix1756 (.Y (nx1755), .A0 (Shift_Val[2]), .A1 (nx262), .B0 (nx282), .B1 (
          nx2224)) ;
    nand02 ix283 (.Y (nx282), .A0 (nx1758), .A1 (nx1760)) ;
    aoi22 ix1759 (.Y (nx1758), .A0 (MEM_Src[2]), .A1 (nx2188), .B0 (WRB_Src[2])
          , .B1 (nx2218)) ;
    aoi222 ix1761 (.Y (nx1760), .A0 (MEM_Dst[2]), .A1 (nx2204), .B0 (WRB_Dst[2])
           , .B1 (nx2212), .C0 (Rdst_Data[2]), .C1 (nx2196)) ;
    nand02 ix685 (.Y (nx684), .A0 (nx1765), .A1 (nx1767)) ;
    aoi22 ix1766 (.Y (nx1765), .A0 (MEM_Src[1]), .A1 (nx2188), .B0 (WRB_Src[1])
          , .B1 (nx2218)) ;
    aoi222 ix1768 (.Y (nx1767), .A0 (MEM_Dst[1]), .A1 (nx2204), .B0 (WRB_Dst[1])
           , .B1 (nx2212), .C0 (Rdst_Data[1]), .C1 (nx2196)) ;
    xnor2 ix1771 (.Y (nx1770), .A0 (nx1772), .A1 (nx1546)) ;
    aoi221 ix1773 (.Y (nx1772), .A0 (Shift_Val[0]), .A1 (nx262), .B0 (nx518), .B1 (
           nx2224), .C0 (nx1532)) ;
    nand02 ix519 (.Y (nx518), .A0 (nx1775), .A1 (nx1777)) ;
    aoi22 ix1776 (.Y (nx1775), .A0 (MEM_Src[0]), .A1 (nx2188), .B0 (WRB_Src[0])
          , .B1 (nx2218)) ;
    aoi222 ix1778 (.Y (nx1777), .A0 (MEM_Dst[0]), .A1 (nx2204), .B0 (WRB_Dst[0])
           , .B1 (nx2212), .C0 (Rdst_Data[0]), .C1 (nx2196)) ;
    nand04 ix1547 (.Y (nx1546), .A0 (nx1781), .A1 (DEC_Ctrl[8]), .A2 (
           DEC_Ctrl[7]), .A3 (DEC_Ctrl[6])) ;
    inv01 ix1782 (.Y (nx1781), .A (DEC_Ctrl[9])) ;
    nor03_2x ix1581 (.Y (INTR_Stall), .A0 (nx1784), .A1 (nx1789), .A2 (nx1502)
             ) ;
    aoi33 ix1785 (.Y (nx1784), .A0 (nx1478), .A1 (EXE_Ctrl[2]), .A2 (nx1562), .B0 (
          nx1548), .B1 (DEC_Ctrl[2]), .B2 (nx1568)) ;
    xor2 ix1563 (.Y (nx1562), .A0 (EXE_Dst[1]), .A1 (nx1476)) ;
    inv01 ix1790 (.Y (nx1789), .A (INTR)) ;
    nand02 ix1503 (.Y (nx1502), .A0 (nx1641), .A1 (nx1721)) ;
    nor02ii ix1651 (.Y (Flush), .A0 (Stall), .A1 (nx1646)) ;
    nor02ii ix1621 (.Y (Stall), .A0 (nx1794), .A1 (EXE_Ctrl[1])) ;
    aoi44 ix1795 (.Y (nx1794), .A0 (Rsrc_Load), .A1 (nx1796), .A2 (nx1798), .A3 (
          nx1800), .B0 (Rdst_Load), .B1 (nx1802), .B2 (nx1804), .B3 (nx1806)) ;
    xnor2 ix1797 (.Y (nx1796), .A0 (Rsrc[2]), .A1 (EXE_Src[18])) ;
    xnor2 ix1799 (.Y (nx1798), .A0 (Rsrc[0]), .A1 (EXE_Src[16])) ;
    xnor2 ix1801 (.Y (nx1800), .A0 (Rsrc[1]), .A1 (EXE_Src[17])) ;
    xnor2 ix1803 (.Y (nx1802), .A0 (Rdst[2]), .A1 (EXE_Src[18])) ;
    xnor2 ix1805 (.Y (nx1804), .A0 (Rdst[0]), .A1 (EXE_Src[16])) ;
    xnor2 ix1807 (.Y (nx1806), .A0 (Rdst[1]), .A1 (EXE_Src[17])) ;
    nand04 ix1647 (.Y (nx1646), .A0 (nx1809), .A1 (nx1813), .A2 (nx1815), .A3 (
           nx1817)) ;
    nand04 ix1812 (.Y (nx1811), .A0 (WRB_Src[18]), .A1 (WRB_Src[17]), .A2 (
           WRB_Src[16]), .A3 (WRB_Src[19])) ;
    inv01 ix1814 (.Y (nx1813), .A (Immediate_Load)) ;
    aoi44 ix1816 (.Y (nx1815), .A0 (Rsrc[2]), .A1 (Rsrc[1]), .A2 (Rsrc[0]), .A3 (
          Rsrc_WB), .B0 (MEM_Src[18]), .B1 (MEM_Src[17]), .B2 (MEM_Src[16]), .B3 (
          MEM_Src[19])) ;
    nand04 ix1818 (.Y (nx1817), .A0 (EXE_Src[18]), .A1 (EXE_Src[17]), .A2 (
           EXE_Src[16]), .A3 (EXE_Src[19])) ;
    oai221 ix1207 (.Y (PC_Next[0]), .A0 (nx1820), .A1 (nx1822), .B0 (
           PC_Fetching[0]), .B1 (nx1868), .C0 (nx1871)) ;
    inv01 ix1821 (.Y (nx1820), .A (Branch_Taken)) ;
    xnor2 ix1826 (.Y (nx1825), .A0 (Rsrc[2]), .A1 (MEM_Src[18])) ;
    xnor2 ix1828 (.Y (nx1827), .A0 (Rsrc[0]), .A1 (MEM_Src[16])) ;
    xnor2 ix1830 (.Y (nx1829), .A0 (Rsrc[1]), .A1 (MEM_Src[17])) ;
    nand04 ix1833 (.Y (nx1832), .A0 (MEM_Dst[19]), .A1 (nx1834), .A2 (nx1836), .A3 (
           nx1838)) ;
    xnor2 ix1835 (.Y (nx1834), .A0 (Rsrc[2]), .A1 (MEM_Dst[18])) ;
    xnor2 ix1837 (.Y (nx1836), .A0 (Rsrc[0]), .A1 (MEM_Dst[16])) ;
    xnor2 ix1839 (.Y (nx1838), .A0 (Rsrc[1]), .A1 (MEM_Dst[17])) ;
    aoi222 ix1842 (.Y (nx1841), .A0 (WRB_Src[0]), .A1 (nx2246), .B0 (WRB_Dst[0])
           , .B1 (nx2250), .C0 (Rsrc_Data[0]), .C1 (nx2254)) ;
    nor02_2x ix593 (.Y (nx592), .A0 (nx1844), .A1 (nx1852)) ;
    nand04 ix1845 (.Y (nx1844), .A0 (WRB_Src[19]), .A1 (nx1846), .A2 (nx1848), .A3 (
           nx1850)) ;
    xnor2 ix1847 (.Y (nx1846), .A0 (Rsrc[2]), .A1 (WRB_Src[18])) ;
    xnor2 ix1849 (.Y (nx1848), .A0 (Rsrc[0]), .A1 (WRB_Src[16])) ;
    xnor2 ix1851 (.Y (nx1850), .A0 (Rsrc[1]), .A1 (WRB_Src[17])) ;
    nand02 ix1853 (.Y (nx1852), .A0 (nx1832), .A1 (nx1854)) ;
    nand04 ix1855 (.Y (nx1854), .A0 (MEM_Src[19]), .A1 (nx1825), .A2 (nx1827), .A3 (
           nx1829)) ;
    nand04 ix1858 (.Y (nx1857), .A0 (WRB_Dst[19]), .A1 (nx1859), .A2 (nx1861), .A3 (
           nx1863)) ;
    xnor2 ix1860 (.Y (nx1859), .A0 (Rsrc[2]), .A1 (WRB_Dst[18])) ;
    xnor2 ix1862 (.Y (nx1861), .A0 (Rsrc[0]), .A1 (WRB_Dst[16])) ;
    xnor2 ix1864 (.Y (nx1863), .A0 (Rsrc[1]), .A1 (WRB_Dst[17])) ;
    nand02 ix1161 (.Y (nx1160), .A0 (nx1811), .A1 (nx1820)) ;
    aoi222 ix1872 (.Y (nx1871), .A0 (WRB_Src[0]), .A1 (nx2272), .B0 (PC_Reset[0]
           ), .B1 (nx2286), .C0 (PC_INTR[0]), .C1 (nx2266)) ;
    nor02_2x ix1181 (.Y (nx1180), .A0 (Branch_Taken), .A1 (nx1811)) ;
    nor03_2x ix1169 (.Y (nx1168), .A0 (nx1160), .A1 (RESET), .A2 (nx1789)) ;
    nand02 ix1233 (.Y (PC_Next[1]), .A0 (nx1877), .A1 (nx1884)) ;
    aoi22 ix1878 (.Y (nx1877), .A0 (PC_INTR[1]), .A1 (nx2266), .B0 (Branch_Taken
          ), .B1 (nx706)) ;
    nand02 ix707 (.Y (nx706), .A0 (nx1880), .A1 (nx1882)) ;
    aoi22 ix1881 (.Y (nx1880), .A0 (MEM_Src[1]), .A1 (nx2244), .B0 (MEM_Dst[1])
          , .B1 (nx2258)) ;
    aoi222 ix1883 (.Y (nx1882), .A0 (WRB_Src[1]), .A1 (nx2246), .B0 (WRB_Dst[1])
           , .B1 (nx2250), .C0 (Rsrc_Data[1]), .C1 (nx2254)) ;
    aoi322 ix1885 (.Y (nx1884), .A0 (nx1210), .A1 (nx1887), .A2 (nx2274), .B0 (
           PC_Reset[1]), .B1 (nx2286), .C0 (WRB_Src[1]), .C1 (nx2272)) ;
    or02 ix1211 (.Y (nx1210), .A0 (PC_Fetching[1]), .A1 (PC_Fetching[0])) ;
    nand02 ix1888 (.Y (nx1887), .A0 (PC_Fetching[0]), .A1 (PC_Fetching[1])) ;
    nor03_2x ix1197 (.Y (nx1196), .A0 (nx1160), .A1 (RESET), .A2 (INTR)) ;
    nand02 ix1259 (.Y (PC_Next[2]), .A0 (nx1891), .A1 (nx1898)) ;
    aoi22 ix1892 (.Y (nx1891), .A0 (PC_INTR[2]), .A1 (nx2266), .B0 (Branch_Taken
          ), .B1 (nx738)) ;
    nand02 ix739 (.Y (nx738), .A0 (nx1894), .A1 (nx1896)) ;
    aoi22 ix1895 (.Y (nx1894), .A0 (MEM_Src[2]), .A1 (nx2244), .B0 (MEM_Dst[2])
          , .B1 (nx2258)) ;
    aoi222 ix1897 (.Y (nx1896), .A0 (WRB_Src[2]), .A1 (nx2246), .B0 (WRB_Dst[2])
           , .B1 (nx2250), .C0 (Rsrc_Data[2]), .C1 (nx2254)) ;
    aoi322 ix1899 (.Y (nx1898), .A0 (nx1236), .A1 (nx1903), .A2 (nx2274), .B0 (
           PC_Reset[2]), .B1 (nx2286), .C0 (WRB_Src[2]), .C1 (nx2272)) ;
    nand02 ix1237 (.Y (nx1236), .A0 (nx1887), .A1 (nx1901)) ;
    inv01 ix1902 (.Y (nx1901), .A (PC_Fetching[2])) ;
    nand03 ix1904 (.Y (nx1903), .A0 (PC_Fetching[2]), .A1 (PC_Fetching[0]), .A2 (
           PC_Fetching[1])) ;
    nand02 ix1285 (.Y (PC_Next[3]), .A0 (nx1906), .A1 (nx1913)) ;
    aoi22 ix1907 (.Y (nx1906), .A0 (PC_INTR[3]), .A1 (nx2266), .B0 (Branch_Taken
          ), .B1 (nx770)) ;
    nand02 ix771 (.Y (nx770), .A0 (nx1909), .A1 (nx1911)) ;
    aoi22 ix1910 (.Y (nx1909), .A0 (MEM_Src[3]), .A1 (nx2244), .B0 (MEM_Dst[3])
          , .B1 (nx2258)) ;
    aoi222 ix1912 (.Y (nx1911), .A0 (WRB_Src[3]), .A1 (nx2246), .B0 (WRB_Dst[3])
           , .B1 (nx2250), .C0 (Rsrc_Data[3]), .C1 (nx2254)) ;
    aoi322 ix1914 (.Y (nx1913), .A0 (nx1262), .A1 (nx1918), .A2 (nx2274), .B0 (
           PC_Reset[3]), .B1 (nx2286), .C0 (WRB_Src[3]), .C1 (nx2272)) ;
    nand02 ix1263 (.Y (nx1262), .A0 (nx1903), .A1 (nx1916)) ;
    inv01 ix1917 (.Y (nx1916), .A (PC_Fetching[3])) ;
    nand04 ix1919 (.Y (nx1918), .A0 (PC_Fetching[3]), .A1 (PC_Fetching[2]), .A2 (
           PC_Fetching[0]), .A3 (PC_Fetching[1])) ;
    nand02 ix1311 (.Y (PC_Next[4]), .A0 (nx1921), .A1 (nx1928)) ;
    aoi22 ix1922 (.Y (nx1921), .A0 (PC_INTR[4]), .A1 (nx2266), .B0 (Branch_Taken
          ), .B1 (nx802)) ;
    nand02 ix803 (.Y (nx802), .A0 (nx1924), .A1 (nx1926)) ;
    aoi22 ix1925 (.Y (nx1924), .A0 (MEM_Src[4]), .A1 (nx2244), .B0 (MEM_Dst[4])
          , .B1 (nx2258)) ;
    aoi222 ix1927 (.Y (nx1926), .A0 (WRB_Src[4]), .A1 (nx2246), .B0 (WRB_Dst[4])
           , .B1 (nx2250), .C0 (Rsrc_Data[4]), .C1 (nx2254)) ;
    aoi322 ix1929 (.Y (nx1928), .A0 (nx1288), .A1 (nx1933), .A2 (nx2274), .B0 (
           PC_Reset[4]), .B1 (nx2286), .C0 (WRB_Src[4]), .C1 (nx2272)) ;
    nand02 ix1289 (.Y (nx1288), .A0 (nx1918), .A1 (nx1931)) ;
    inv01 ix1932 (.Y (nx1931), .A (PC_Fetching[4])) ;
    nand02 ix1337 (.Y (PC_Next[5]), .A0 (nx1937), .A1 (nx1944)) ;
    aoi22 ix1938 (.Y (nx1937), .A0 (PC_INTR[5]), .A1 (nx2266), .B0 (Branch_Taken
          ), .B1 (nx834)) ;
    nand02 ix835 (.Y (nx834), .A0 (nx1940), .A1 (nx1942)) ;
    aoi22 ix1941 (.Y (nx1940), .A0 (MEM_Src[5]), .A1 (nx2244), .B0 (MEM_Dst[5])
          , .B1 (nx2258)) ;
    aoi222 ix1943 (.Y (nx1942), .A0 (WRB_Src[5]), .A1 (nx2246), .B0 (WRB_Dst[5])
           , .B1 (nx2250), .C0 (Rsrc_Data[5]), .C1 (nx2254)) ;
    aoi322 ix1945 (.Y (nx1944), .A0 (nx1314), .A1 (nx1948), .A2 (nx2274), .B0 (
           PC_Reset[5]), .B1 (nx2286), .C0 (WRB_Src[5]), .C1 (nx2272)) ;
    or02 ix1315 (.Y (nx1314), .A0 (nx1290), .A1 (PC_Fetching[5])) ;
    nor02ii ix1291 (.Y (nx1290), .A0 (nx1918), .A1 (PC_Fetching[4])) ;
    nand02 ix1949 (.Y (nx1948), .A0 (PC_Fetching[5]), .A1 (nx1290)) ;
    nand02 ix1363 (.Y (PC_Next[6]), .A0 (nx1951), .A1 (nx1958)) ;
    aoi22 ix1952 (.Y (nx1951), .A0 (PC_INTR[6]), .A1 (nx2266), .B0 (Branch_Taken
          ), .B1 (nx866)) ;
    nand02 ix867 (.Y (nx866), .A0 (nx1954), .A1 (nx1956)) ;
    aoi22 ix1955 (.Y (nx1954), .A0 (MEM_Src[6]), .A1 (nx584), .B0 (MEM_Dst[6]), 
          .B1 (nx2258)) ;
    aoi222 ix1957 (.Y (nx1956), .A0 (WRB_Src[6]), .A1 (nx2246), .B0 (WRB_Dst[6])
           , .B1 (nx2250), .C0 (Rsrc_Data[6]), .C1 (nx2254)) ;
    aoi322 ix1959 (.Y (nx1958), .A0 (nx1340), .A1 (nx1963), .A2 (nx2274), .B0 (
           PC_Reset[6]), .B1 (nx1174), .C0 (WRB_Src[6]), .C1 (nx1180)) ;
    nand02 ix1341 (.Y (nx1340), .A0 (nx1948), .A1 (nx1961)) ;
    inv01 ix1962 (.Y (nx1961), .A (PC_Fetching[6])) ;
    nand02 ix1389 (.Y (PC_Next[7]), .A0 (nx1967), .A1 (nx1974)) ;
    aoi22 ix1968 (.Y (nx1967), .A0 (PC_INTR[7]), .A1 (nx2268), .B0 (Branch_Taken
          ), .B1 (nx898)) ;
    nand02 ix899 (.Y (nx898), .A0 (nx1970), .A1 (nx1972)) ;
    aoi22 ix1971 (.Y (nx1970), .A0 (MEM_Src[7]), .A1 (nx584), .B0 (MEM_Dst[7]), 
          .B1 (nx2258)) ;
    aoi222 ix1973 (.Y (nx1972), .A0 (WRB_Src[7]), .A1 (nx2248), .B0 (WRB_Dst[7])
           , .B1 (nx2252), .C0 (Rsrc_Data[7]), .C1 (nx2256)) ;
    aoi322 ix1975 (.Y (nx1974), .A0 (nx1366), .A1 (nx1978), .A2 (nx2274), .B0 (
           PC_Reset[7]), .B1 (nx1174), .C0 (WRB_Src[7]), .C1 (nx1180)) ;
    or02 ix1367 (.Y (nx1366), .A0 (nx1342), .A1 (PC_Fetching[7])) ;
    nor02ii ix1343 (.Y (nx1342), .A0 (nx1948), .A1 (PC_Fetching[6])) ;
    nand02 ix1979 (.Y (nx1978), .A0 (PC_Fetching[7]), .A1 (nx1342)) ;
    nand02 ix1415 (.Y (PC_Next[8]), .A0 (nx1981), .A1 (nx1988)) ;
    aoi22 ix1982 (.Y (nx1981), .A0 (PC_INTR[8]), .A1 (nx2268), .B0 (Branch_Taken
          ), .B1 (nx930)) ;
    nand02 ix931 (.Y (nx930), .A0 (nx1984), .A1 (nx1986)) ;
    aoi22 ix1985 (.Y (nx1984), .A0 (MEM_Src[8]), .A1 (nx584), .B0 (MEM_Dst[8]), 
          .B1 (nx2260)) ;
    aoi222 ix1987 (.Y (nx1986), .A0 (WRB_Src[8]), .A1 (nx2248), .B0 (WRB_Dst[8])
           , .B1 (nx2252), .C0 (Rsrc_Data[8]), .C1 (nx2256)) ;
    aoi322 ix1989 (.Y (nx1988), .A0 (nx1392), .A1 (nx1993), .A2 (nx2276), .B0 (
           PC_Reset[8]), .B1 (nx1174), .C0 (WRB_Src[8]), .C1 (nx1180)) ;
    nand02 ix1393 (.Y (nx1392), .A0 (nx1978), .A1 (nx1991)) ;
    inv01 ix1992 (.Y (nx1991), .A (PC_Fetching[8])) ;
    oai221 ix1435 (.Y (PC_Next[9]), .A0 (nx1820), .A1 (nx1997), .B0 (nx2002), .B1 (
           nx1868), .C0 (nx2005)) ;
    aoi222 ix2001 (.Y (nx2000), .A0 (WRB_Src[9]), .A1 (nx2248), .B0 (WRB_Dst[9])
           , .B1 (nx2252), .C0 (Rsrc_Data[9]), .C1 (nx2256)) ;
    xnor2 ix2003 (.Y (nx2002), .A0 (PC_Fetching[9]), .A1 (nx1394)) ;
    nor02ii ix1395 (.Y (nx1394), .A0 (nx1978), .A1 (PC_Fetching[8])) ;
    aoi222 ix2006 (.Y (nx2005), .A0 (WRB_Src[9]), .A1 (nx1180), .B0 (PC_Reset[9]
           ), .B1 (nx2286), .C0 (PC_INTR[9]), .C1 (nx2268)) ;
    aoi22 ix2009 (.Y (nx2008), .A0 (Mem_EA[0]), .A1 (Mem_EA_Load), .B0 (
          Port_In_Data[0]), .B1 (nx2230)) ;
    aoi22 ix2014 (.Y (nx2013), .A0 (Mem_EA[1]), .A1 (Mem_EA_Load), .B0 (
          Port_In_Data[1]), .B1 (nx2230)) ;
    ao32 ix135 (.Y (Dst_Dout[10]), .A0 (Port_In_Data[10]), .A1 (nx2018), .A2 (
         Port_In_RD), .B0 (nx114), .B1 (nx2224)) ;
    inv01 ix2019 (.Y (nx2018), .A (Mem_EA_Load)) ;
    nand02 ix115 (.Y (nx114), .A0 (nx2021), .A1 (nx2023)) ;
    aoi22 ix2022 (.Y (nx2021), .A0 (MEM_Src[10]), .A1 (nx2188), .B0 (WRB_Src[10]
          ), .B1 (nx2218)) ;
    aoi222 ix2024 (.Y (nx2023), .A0 (MEM_Dst[10]), .A1 (nx2204), .B0 (
           WRB_Dst[10]), .B1 (nx2212), .C0 (Rdst_Data[10]), .C1 (nx2196)) ;
    ao32 ix159 (.Y (Dst_Dout[11]), .A0 (Port_In_Data[11]), .A1 (nx2018), .A2 (
         Port_In_RD), .B0 (nx152), .B1 (nx2224)) ;
    nand02 ix153 (.Y (nx152), .A0 (nx2027), .A1 (nx2029)) ;
    aoi22 ix2028 (.Y (nx2027), .A0 (MEM_Src[11]), .A1 (nx2188), .B0 (WRB_Src[11]
          ), .B1 (nx2218)) ;
    aoi222 ix2030 (.Y (nx2029), .A0 (MEM_Dst[11]), .A1 (nx2204), .B0 (
           WRB_Dst[11]), .B1 (nx2212), .C0 (Rdst_Data[11]), .C1 (nx2196)) ;
    ao32 ix183 (.Y (Dst_Dout[12]), .A0 (Port_In_Data[12]), .A1 (nx2018), .A2 (
         Port_In_RD), .B0 (nx176), .B1 (nx2224)) ;
    nand02 ix177 (.Y (nx176), .A0 (nx2033), .A1 (nx2035)) ;
    aoi22 ix2034 (.Y (nx2033), .A0 (MEM_Src[12]), .A1 (nx2188), .B0 (WRB_Src[12]
          ), .B1 (nx2218)) ;
    aoi222 ix2036 (.Y (nx2035), .A0 (MEM_Dst[12]), .A1 (nx2204), .B0 (
           WRB_Dst[12]), .B1 (nx2212), .C0 (Rdst_Data[12]), .C1 (nx2196)) ;
    ao32 ix207 (.Y (Dst_Dout[13]), .A0 (Port_In_Data[13]), .A1 (nx2018), .A2 (
         Port_In_RD), .B0 (nx200), .B1 (nx2224)) ;
    nand02 ix201 (.Y (nx200), .A0 (nx2039), .A1 (nx2041)) ;
    aoi22 ix2040 (.Y (nx2039), .A0 (MEM_Src[13]), .A1 (nx2190), .B0 (WRB_Src[13]
          ), .B1 (nx2218)) ;
    aoi222 ix2042 (.Y (nx2041), .A0 (MEM_Dst[13]), .A1 (nx2204), .B0 (
           WRB_Dst[13]), .B1 (nx2212), .C0 (Rdst_Data[13]), .C1 (nx2196)) ;
    ao32 ix231 (.Y (Dst_Dout[14]), .A0 (Port_In_Data[14]), .A1 (nx2018), .A2 (
         Port_In_RD), .B0 (nx224), .B1 (nx2226)) ;
    nand02 ix225 (.Y (nx224), .A0 (nx2045), .A1 (nx2047)) ;
    aoi22 ix2046 (.Y (nx2045), .A0 (MEM_Src[14]), .A1 (nx2190), .B0 (WRB_Src[14]
          ), .B1 (nx106)) ;
    aoi222 ix2048 (.Y (nx2047), .A0 (MEM_Dst[14]), .A1 (nx2206), .B0 (
           WRB_Dst[14]), .B1 (nx2214), .C0 (Rdst_Data[14]), .C1 (nx2198)) ;
    ao32 ix255 (.Y (Dst_Dout[15]), .A0 (Port_In_Data[15]), .A1 (nx2018), .A2 (
         Port_In_RD), .B0 (nx248), .B1 (nx2226)) ;
    nand02 ix249 (.Y (nx248), .A0 (nx2051), .A1 (nx2053)) ;
    aoi22 ix2052 (.Y (nx2051), .A0 (MEM_Src[15]), .A1 (nx2190), .B0 (WRB_Src[15]
          ), .B1 (nx106)) ;
    aoi222 ix2054 (.Y (nx2053), .A0 (MEM_Dst[15]), .A1 (nx2206), .B0 (
           WRB_Dst[15]), .B1 (nx2214), .C0 (Rdst_Data[15]), .C1 (nx2198)) ;
    nand02 ix665 (.Y (Src_Dout[0]), .A0 (nx2056), .A1 (nx2062)) ;
    aoi22 ix2057 (.Y (nx2056), .A0 (Immediate_Val[0]), .A1 (Immediate_Load), .B0 (
          nx646), .B1 (nx2262)) ;
    nand02 ix647 (.Y (nx646), .A0 (nx2059), .A1 (nx1841)) ;
    aoi22 ix2060 (.Y (nx2059), .A0 (MEM_Src[0]), .A1 (nx584), .B0 (MEM_Dst[0]), 
          .B1 (nx2260)) ;
    nor03_2x ix657 (.Y (nx656), .A0 (Immediate_Load), .A1 (PC_Flags_Save), .A2 (
             Mem_Addr_Switch)) ;
    aoi22 ix2063 (.Y (nx2062), .A0 (PC_To_Store[0]), .A1 (nx2232), .B0 (nx518), 
          .B1 (nx2238)) ;
    nor02ii ix499 (.Y (nx498), .A0 (Immediate_Load), .A1 (PC_Flags_Save)) ;
    inv01 ix2067 (.Y (nx2066), .A (Mem_Addr_Switch)) ;
    nand02 ix715 (.Y (Src_Dout[1]), .A0 (nx2069), .A1 (nx2071)) ;
    aoi22 ix2070 (.Y (nx2069), .A0 (Immediate_Val[1]), .A1 (Immediate_Load), .B0 (
          nx706), .B1 (nx2262)) ;
    aoi22 ix2072 (.Y (nx2071), .A0 (PC_To_Store[1]), .A1 (nx2232), .B0 (nx684), 
          .B1 (nx2238)) ;
    nand02 ix747 (.Y (Src_Dout[2]), .A0 (nx2074), .A1 (nx2076)) ;
    aoi22 ix2075 (.Y (nx2074), .A0 (Immediate_Val[2]), .A1 (Immediate_Load), .B0 (
          nx738), .B1 (nx2262)) ;
    aoi22 ix2077 (.Y (nx2076), .A0 (PC_To_Store[2]), .A1 (nx2232), .B0 (nx282), 
          .B1 (nx2238)) ;
    nand02 ix779 (.Y (Src_Dout[3]), .A0 (nx2079), .A1 (nx2081)) ;
    aoi22 ix2080 (.Y (nx2079), .A0 (Immediate_Val[3]), .A1 (Immediate_Load), .B0 (
          nx770), .B1 (nx2262)) ;
    aoi22 ix2082 (.Y (nx2081), .A0 (PC_To_Store[3]), .A1 (nx2232), .B0 (nx314), 
          .B1 (nx2238)) ;
    nand02 ix811 (.Y (Src_Dout[4]), .A0 (nx2084), .A1 (nx2086)) ;
    aoi22 ix2085 (.Y (nx2084), .A0 (Immediate_Val[4]), .A1 (Immediate_Load), .B0 (
          nx802), .B1 (nx2262)) ;
    aoi22 ix2087 (.Y (nx2086), .A0 (PC_To_Store[4]), .A1 (nx2232), .B0 (nx346), 
          .B1 (nx2238)) ;
    nand02 ix843 (.Y (Src_Dout[5]), .A0 (nx2089), .A1 (nx2091)) ;
    aoi22 ix2090 (.Y (nx2089), .A0 (Immediate_Val[5]), .A1 (Immediate_Load), .B0 (
          nx834), .B1 (nx2262)) ;
    aoi22 ix2092 (.Y (nx2091), .A0 (PC_To_Store[5]), .A1 (nx2232), .B0 (nx374), 
          .B1 (nx2238)) ;
    nand02 ix875 (.Y (Src_Dout[6]), .A0 (nx2094), .A1 (nx2096)) ;
    aoi22 ix2095 (.Y (nx2094), .A0 (Immediate_Val[6]), .A1 (Immediate_Load), .B0 (
          nx866), .B1 (nx2262)) ;
    aoi22 ix2097 (.Y (nx2096), .A0 (PC_To_Store[6]), .A1 (nx2232), .B0 (nx402), 
          .B1 (nx2238)) ;
    nand02 ix907 (.Y (Src_Dout[7]), .A0 (nx2099), .A1 (nx2101)) ;
    aoi22 ix2100 (.Y (nx2099), .A0 (Immediate_Val[7]), .A1 (Immediate_Load), .B0 (
          nx898), .B1 (nx2264)) ;
    aoi22 ix2102 (.Y (nx2101), .A0 (PC_To_Store[7]), .A1 (nx2234), .B0 (nx430), 
          .B1 (nx2240)) ;
    nand02 ix939 (.Y (Src_Dout[8]), .A0 (nx2104), .A1 (nx2106)) ;
    aoi22 ix2105 (.Y (nx2104), .A0 (Immediate_Val[8]), .A1 (Immediate_Load), .B0 (
          nx930), .B1 (nx2264)) ;
    aoi22 ix2107 (.Y (nx2106), .A0 (PC_To_Store[8]), .A1 (nx2234), .B0 (nx458), 
          .B1 (nx2240)) ;
    nand02 ix971 (.Y (Src_Dout[9]), .A0 (nx2109), .A1 (nx2114)) ;
    aoi22 ix2110 (.Y (nx2109), .A0 (Immediate_Val[9]), .A1 (Immediate_Load), .B0 (
          nx962), .B1 (nx2264)) ;
    nand02 ix963 (.Y (nx962), .A0 (nx2112), .A1 (nx2000)) ;
    aoi22 ix2113 (.Y (nx2112), .A0 (MEM_Src[9]), .A1 (nx584), .B0 (MEM_Dst[9]), 
          .B1 (nx2260)) ;
    aoi22 ix2115 (.Y (nx2114), .A0 (PC_To_Store[9]), .A1 (nx2234), .B0 (nx486), 
          .B1 (nx2240)) ;
    nand04 ix1011 (.Y (Src_Dout[10]), .A0 (nx2117), .A1 (nx2119), .A2 (nx2126), 
           .A3 (nx2134)) ;
    aoi22 ix2118 (.Y (nx2117), .A0 (Immediate_Val[10]), .A1 (Immediate_Load), .B0 (
          nx114), .B1 (nx2240)) ;
    aoi22 ix2120 (.Y (nx2119), .A0 (Flags[0]), .A1 (nx2234), .B0 (Rsrc_Data[10])
          , .B1 (nx2284)) ;
    nand03 ix2125 (.Y (nx2124), .A0 (nx590), .A1 (nx1857), .A2 (nx1844)) ;
    aoi22 ix2127 (.Y (nx2126), .A0 (MEM_Dst[10]), .A1 (nx982), .B0 (WRB_Dst[10])
          , .B1 (nx986)) ;
    aoi22 ix2135 (.Y (nx2134), .A0 (MEM_Src[10]), .A1 (nx972), .B0 (WRB_Src[10])
          , .B1 (nx976)) ;
    nand04 ix1041 (.Y (Src_Dout[11]), .A0 (nx2141), .A1 (nx2143), .A2 (nx2145), 
           .A3 (nx2147)) ;
    aoi22 ix2142 (.Y (nx2141), .A0 (Immediate_Val[11]), .A1 (Immediate_Load), .B0 (
          nx152), .B1 (nx2240)) ;
    aoi22 ix2144 (.Y (nx2143), .A0 (Flags[1]), .A1 (nx2234), .B0 (Rsrc_Data[11])
          , .B1 (nx2284)) ;
    aoi22 ix2146 (.Y (nx2145), .A0 (MEM_Dst[11]), .A1 (nx982), .B0 (WRB_Dst[11])
          , .B1 (nx986)) ;
    aoi22 ix2148 (.Y (nx2147), .A0 (MEM_Src[11]), .A1 (nx972), .B0 (WRB_Src[11])
          , .B1 (nx976)) ;
    nand04 ix1071 (.Y (Src_Dout[12]), .A0 (nx2150), .A1 (nx2152), .A2 (nx2154), 
           .A3 (nx2156)) ;
    aoi22 ix2151 (.Y (nx2150), .A0 (Immediate_Val[12]), .A1 (Immediate_Load), .B0 (
          nx176), .B1 (nx2240)) ;
    aoi22 ix2153 (.Y (nx2152), .A0 (Flags[2]), .A1 (nx2234), .B0 (Rsrc_Data[12])
          , .B1 (nx2284)) ;
    aoi22 ix2155 (.Y (nx2154), .A0 (MEM_Dst[12]), .A1 (nx982), .B0 (WRB_Dst[12])
          , .B1 (nx986)) ;
    aoi22 ix2157 (.Y (nx2156), .A0 (MEM_Src[12]), .A1 (nx972), .B0 (WRB_Src[12])
          , .B1 (nx976)) ;
    nand04 ix1101 (.Y (Src_Dout[13]), .A0 (nx2159), .A1 (nx2161), .A2 (nx2163), 
           .A3 (nx2165)) ;
    aoi22 ix2160 (.Y (nx2159), .A0 (Immediate_Val[13]), .A1 (Immediate_Load), .B0 (
          nx200), .B1 (nx2240)) ;
    aoi22 ix2162 (.Y (nx2161), .A0 (Flags[3]), .A1 (nx2234), .B0 (Rsrc_Data[13])
          , .B1 (nx2284)) ;
    aoi22 ix2164 (.Y (nx2163), .A0 (MEM_Dst[13]), .A1 (nx982), .B0 (WRB_Dst[13])
          , .B1 (nx986)) ;
    aoi22 ix2166 (.Y (nx2165), .A0 (MEM_Src[13]), .A1 (nx972), .B0 (WRB_Src[13])
          , .B1 (nx976)) ;
    nand03 ix1127 (.Y (Src_Dout[14]), .A0 (nx2168), .A1 (nx2170), .A2 (nx2172)
           ) ;
    aoi222 ix2169 (.Y (nx2168), .A0 (Rsrc_Data[14]), .A1 (nx2284), .B0 (
           Immediate_Val[14]), .B1 (Immediate_Load), .C0 (nx224), .C1 (nx2242)
           ) ;
    aoi22 ix2171 (.Y (nx2170), .A0 (MEM_Dst[14]), .A1 (nx982), .B0 (WRB_Dst[14])
          , .B1 (nx986)) ;
    aoi22 ix2173 (.Y (nx2172), .A0 (MEM_Src[14]), .A1 (nx972), .B0 (WRB_Src[14])
          , .B1 (nx976)) ;
    nand03 ix1153 (.Y (Src_Dout[15]), .A0 (nx2175), .A1 (nx2177), .A2 (nx2179)
           ) ;
    aoi222 ix2176 (.Y (nx2175), .A0 (Rsrc_Data[15]), .A1 (nx2284), .B0 (
           Immediate_Load), .B1 (Immediate_Val[15]), .C0 (nx248), .C1 (nx2242)
           ) ;
    aoi22 ix2178 (.Y (nx2177), .A0 (MEM_Dst[15]), .A1 (nx982), .B0 (WRB_Dst[15])
          , .B1 (nx986)) ;
    aoi22 ix2180 (.Y (nx2179), .A0 (MEM_Src[15]), .A1 (nx972), .B0 (WRB_Src[15])
          , .B1 (nx976)) ;
    inv01 ix1549 (.Y (nx1548), .A (nx1770)) ;
    inv01 ix1533 (.Y (nx1532), .A (nx2008)) ;
    inv01 ix1519 (.Y (nx1518), .A (nx2013)) ;
    inv01 ix1640 (.Y (nx1639), .A (nx1502)) ;
    inv01 ix1994 (.Y (nx1993), .A (nx1394)) ;
    inv01 ix1964 (.Y (nx1963), .A (nx1342)) ;
    inv01 ix1934 (.Y (nx1933), .A (nx1290)) ;
    inv02 ix1869 (.Y (nx1868), .A (nx1196)) ;
    inv01 ix1810 (.Y (nx1809), .A (nx1160)) ;
    inv01 ix1998 (.Y (nx1997), .A (nx962)) ;
    inv02 ix2123 (.Y (nx2122), .A (nx656)) ;
    inv01 ix1823 (.Y (nx1822), .A (nx646)) ;
    inv01 ix2139 (.Y (nx2138), .A (nx592)) ;
    inv01 ix591 (.Y (nx590), .A (nx1852)) ;
    inv01 ix585 (.Y (nx584), .A (nx1854)) ;
    inv01 ix549 (.Y (nx548), .A (nx1844)) ;
    inv01 ix77 (.Y (nx76), .A (nx1661)) ;
    inv01 ix41 (.Y (nx40), .A (nx1669)) ;
    inv01 ix1535 (.Y (Dst_Dout[0]), .A (nx1772)) ;
    inv02 ix2185 (.Y (nx2186), .A (nx1679)) ;
    inv02 ix2187 (.Y (nx2188), .A (nx1679)) ;
    inv02 ix2189 (.Y (nx2190), .A (nx1679)) ;
    inv02 ix2193 (.Y (nx2194), .A (nx2192)) ;
    inv02 ix2195 (.Y (nx2196), .A (nx2192)) ;
    inv02 ix2197 (.Y (nx2198), .A (nx2192)) ;
    inv02 ix2201 (.Y (nx2202), .A (nx2200)) ;
    inv02 ix2203 (.Y (nx2204), .A (nx2200)) ;
    inv02 ix2205 (.Y (nx2206), .A (nx2200)) ;
    inv02 ix2209 (.Y (nx2210), .A (nx2208)) ;
    inv02 ix2211 (.Y (nx2212), .A (nx2208)) ;
    inv02 ix2213 (.Y (nx2214), .A (nx2208)) ;
    nor02_2x ix2215 (.Y (nx2216), .A0 (nx1661), .A1 (nx1669)) ;
    nor02_2x ix2217 (.Y (nx2218), .A0 (nx1661), .A1 (nx1669)) ;
    inv01 ix2219 (.Y (nx2220), .A (nx124)) ;
    inv02 ix2221 (.Y (nx2222), .A (nx2220)) ;
    inv02 ix2223 (.Y (nx2224), .A (nx2220)) ;
    inv02 ix2225 (.Y (nx2226), .A (nx2220)) ;
    buf02 ix2227 (.Y (nx2228), .A (nx130)) ;
    buf02 ix2229 (.Y (nx2230), .A (nx130)) ;
    buf02 ix2231 (.Y (nx2232), .A (nx498)) ;
    buf02 ix2233 (.Y (nx2234), .A (nx498)) ;
    inv02 ix2237 (.Y (nx2238), .A (nx2236)) ;
    inv02 ix2239 (.Y (nx2240), .A (nx2236)) ;
    inv02 ix2241 (.Y (nx2242), .A (nx2236)) ;
    inv01 ix2243 (.Y (nx2244), .A (nx1854)) ;
    inv02 ix2245 (.Y (nx2246), .A (nx2138)) ;
    inv02 ix2247 (.Y (nx2248), .A (nx2138)) ;
    inv02 ix2249 (.Y (nx2250), .A (nx2132)) ;
    inv02 ix2251 (.Y (nx2252), .A (nx2132)) ;
    inv02 ix2253 (.Y (nx2254), .A (nx2124)) ;
    inv02 ix2255 (.Y (nx2256), .A (nx2124)) ;
    inv02 ix2257 (.Y (nx2258), .A (nx2129)) ;
    inv02 ix2259 (.Y (nx2260), .A (nx2129)) ;
    inv02 ix2261 (.Y (nx2262), .A (nx2122)) ;
    inv02 ix2263 (.Y (nx2264), .A (nx2122)) ;
    buf02 ix2265 (.Y (nx2266), .A (nx1168)) ;
    buf02 ix2267 (.Y (nx2268), .A (nx1168)) ;
    nor02_2x ix2271 (.Y (nx2272), .A0 (Branch_Taken), .A1 (nx1811)) ;
    inv04 ix2273 (.Y (nx2274), .A (nx1868)) ;
    inv04 ix2275 (.Y (nx2276), .A (nx1868)) ;
    inv01 ix2277 (.Y (nx2278), .A (Dst_Dout[1])) ;
    nor02ii ix1561 (.Y (RESET_Stall), .A0 (nx1623), .A1 (RESET)) ;
    and04 ix1642 (.Y (nx1641), .A0 (nx1645), .A1 (nx1698), .A2 (nx1706), .A3 (
          nx1714)) ;
    or02 ix91 (.Y (nx2200), .A0 (nx1671), .A1 (nx2186)) ;
    or03 ix99 (.Y (nx2208), .A0 (nx1669), .A1 (nx1685), .A2 (nx76)) ;
    nand03 ix85 (.Y (nx2192), .A0 (nx40), .A1 (nx1685), .A2 (nx1661)) ;
    ao221 ix1763 (.Y (Dst_Dout[1]), .A0 (Shift_Val[1]), .A1 (nx262), .B0 (nx684)
          , .B1 (nx2224), .C0 (nx1518)) ;
    xor2 ix1569 (.Y (nx1568), .A0 (Dst_Dout[1]), .A1 (nx1546)) ;
    or02 ix639 (.Y (nx2129), .A0 (nx1832), .A1 (nx2244)) ;
    or03 ix619 (.Y (nx2132), .A0 (nx1852), .A1 (nx1857), .A2 (nx548)) ;
    nor02ii ix1175 (.Y (nx1174), .A0 (nx1160), .A1 (RESET)) ;
    or03 ix527 (.Y (nx2236), .A0 (Immediate_Load), .A1 (PC_Flags_Save), .A2 (
         nx2066)) ;
    nor02ii ix995 (.Y (nx994), .A0 (nx2124), .A1 (nx656)) ;
    nor02ii ix983 (.Y (nx982), .A0 (nx2129), .A1 (nx656)) ;
    nor02ii ix987 (.Y (nx986), .A0 (nx2132), .A1 (nx656)) ;
    nor02ii ix973 (.Y (nx972), .A0 (nx1854), .A1 (nx656)) ;
    and02 ix977 (.Y (nx976), .A0 (nx656), .A1 (nx592)) ;
    nor02ii ix2269 (.Y (nx2270), .A0 (nx1160), .A1 (RESET)) ;
    buf02 ix2283 (.Y (nx2284), .A (nx994)) ;
    buf02 ix2285 (.Y (nx2286), .A (nx2270)) ;
endmodule

