V34 :0x24 inigptr_mod
15 inigptr_mod.F90 S624 0
02/16/2022  17:29:27
use tpm_distr private
use tpm_trans private
enduse
D 64 26 681 5640 680 7
D 286 22 7
D 288 22 7
D 290 22 7
D 292 22 7
D 294 22 7
D 296 22 7
D 298 22 7
D 300 22 7
D 302 22 7
D 304 22 7
D 306 22 7
D 308 22 7
D 310 22 7
D 312 22 7
D 314 22 7
D 316 22 7
D 318 22 7
D 320 22 7
D 322 22 7
D 324 22 7
D 326 22 7
D 328 22 7
D 330 22 7
D 332 22 7
D 334 22 7
D 336 22 7
D 338 22 7
D 340 22 7
D 342 22 7
D 344 22 7
D 346 22 7
D 348 22 7
D 350 22 7
D 352 22 7
D 354 22 7
D 356 22 7
D 487 23 6 3 561 570 0 0 1 0 0
 0 562 11 11 562 562
 0 564 562 11 565 565
 0 567 568 11 569 569
D 490 23 6 1 11 569 0 0 1 0 0
 0 567 11 11 569 569
S 624 24 0 0 0 6 1 0 5013 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 inigptr_mod
S 642 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 648 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 660 6 8 tpm_distr nprtrns
R 680 25 28 tpm_distr distr_type
R 681 5 29 tpm_distr lgridonly distr_type
R 682 5 30 tpm_distr lweighted_distr distr_type
R 683 5 31 tpm_distr lsplit distr_type
R 684 5 32 tpm_distr lcpnmonly distr_type
R 685 5 33 tpm_distr nump distr_type
R 686 5 34 tpm_distr nspec distr_type
R 687 5 35 tpm_distr nspec2 distr_type
R 688 5 36 tpm_distr nspec2mx distr_type
R 689 5 37 tpm_distr ntpec2 distr_type
R 690 5 38 tpm_distr numtp distr_type
R 691 5 39 tpm_distr nspolegl distr_type
R 692 5 40 tpm_distr nlei3d distr_type
R 693 5 41 tpm_distr myms distr_type
R 695 5 43 tpm_distr myms$sd distr_type
R 696 5 44 tpm_distr myms$p distr_type
R 697 5 45 tpm_distr myms$o distr_type
R 699 5 47 tpm_distr numpp distr_type
R 701 5 49 tpm_distr numpp$sd distr_type
R 702 5 50 tpm_distr numpp$p distr_type
R 703 5 51 tpm_distr numpp$o distr_type
R 705 5 53 tpm_distr npossp distr_type
R 707 5 55 tpm_distr npossp$sd distr_type
R 708 5 56 tpm_distr npossp$p distr_type
R 709 5 57 tpm_distr npossp$o distr_type
R 711 5 59 tpm_distr nprocm distr_type
R 713 5 61 tpm_distr nprocm$sd distr_type
R 714 5 62 tpm_distr nprocm$p distr_type
R 715 5 63 tpm_distr nprocm$o distr_type
R 717 5 65 tpm_distr ndim0g distr_type
R 719 5 67 tpm_distr ndim0g$sd distr_type
R 720 5 68 tpm_distr ndim0g$p distr_type
R 721 5 69 tpm_distr ndim0g$o distr_type
R 723 5 71 tpm_distr nasm0 distr_type
R 725 5 73 tpm_distr nasm0$sd distr_type
R 726 5 74 tpm_distr nasm0$p distr_type
R 727 5 75 tpm_distr nasm0$o distr_type
R 729 5 77 tpm_distr natm0 distr_type
R 731 5 79 tpm_distr natm0$sd distr_type
R 732 5 80 tpm_distr natm0$p distr_type
R 733 5 81 tpm_distr natm0$o distr_type
R 735 5 83 tpm_distr nallms distr_type
R 737 5 85 tpm_distr nallms$sd distr_type
R 738 5 86 tpm_distr nallms$p distr_type
R 739 5 87 tpm_distr nallms$o distr_type
R 741 5 89 tpm_distr nptrms distr_type
R 743 5 91 tpm_distr nptrms$sd distr_type
R 744 5 92 tpm_distr nptrms$p distr_type
R 745 5 93 tpm_distr nptrms$o distr_type
R 747 5 95 tpm_distr nlatls distr_type
R 750 5 98 tpm_distr nlatls$sd distr_type
R 751 5 99 tpm_distr nlatls$p distr_type
R 752 5 100 tpm_distr nlatls$o distr_type
R 754 5 102 tpm_distr nlatle distr_type
R 757 5 105 tpm_distr nlatle$sd distr_type
R 758 5 106 tpm_distr nlatle$p distr_type
R 759 5 107 tpm_distr nlatle$o distr_type
R 761 5 109 tpm_distr npmt distr_type
R 763 5 111 tpm_distr npmt$sd distr_type
R 764 5 112 tpm_distr npmt$p distr_type
R 765 5 113 tpm_distr npmt$o distr_type
R 767 5 115 tpm_distr npms distr_type
R 769 5 117 tpm_distr npms$sd distr_type
R 770 5 118 tpm_distr npms$p distr_type
R 771 5 119 tpm_distr npms$o distr_type
R 773 5 121 tpm_distr npmg distr_type
R 775 5 123 tpm_distr npmg$sd distr_type
R 776 5 124 tpm_distr npmg$p distr_type
R 777 5 125 tpm_distr npmg$o distr_type
R 779 5 127 tpm_distr ndgl_fs distr_type
R 780 5 128 tpm_distr nstagtf distr_type
R 782 5 130 tpm_distr nstagtf$sd distr_type
R 783 5 131 tpm_distr nstagtf$p distr_type
R 784 5 132 tpm_distr nstagtf$o distr_type
R 786 5 134 tpm_distr nlengtf distr_type
R 787 5 135 tpm_distr nultpp distr_type
R 789 5 137 tpm_distr nultpp$sd distr_type
R 790 5 138 tpm_distr nultpp$p distr_type
R 791 5 139 tpm_distr nultpp$o distr_type
R 793 5 141 tpm_distr nprocl distr_type
R 795 5 143 tpm_distr nprocl$sd distr_type
R 796 5 144 tpm_distr nprocl$p distr_type
R 797 5 145 tpm_distr nprocl$o distr_type
R 799 5 147 tpm_distr nptrls distr_type
R 801 5 149 tpm_distr nptrls$sd distr_type
R 802 5 150 tpm_distr nptrls$p distr_type
R 803 5 151 tpm_distr nptrls$o distr_type
R 805 5 153 tpm_distr nstagt0b distr_type
R 807 5 155 tpm_distr nstagt0b$sd distr_type
R 808 5 156 tpm_distr nstagt0b$p distr_type
R 809 5 157 tpm_distr nstagt0b$o distr_type
R 811 5 159 tpm_distr nstagt1b distr_type
R 813 5 161 tpm_distr nstagt1b$sd distr_type
R 814 5 162 tpm_distr nstagt1b$p distr_type
R 815 5 163 tpm_distr nstagt1b$o distr_type
R 817 5 165 tpm_distr npntgtb0 distr_type
R 820 5 168 tpm_distr npntgtb0$sd distr_type
R 821 5 169 tpm_distr npntgtb0$p distr_type
R 822 5 170 tpm_distr npntgtb0$o distr_type
R 824 5 172 tpm_distr npntgtb1 distr_type
R 827 5 175 tpm_distr npntgtb1$sd distr_type
R 828 5 176 tpm_distr npntgtb1$p distr_type
R 829 5 177 tpm_distr npntgtb1$o distr_type
R 831 5 179 tpm_distr nltsftb distr_type
R 833 5 181 tpm_distr nltsftb$sd distr_type
R 834 5 182 tpm_distr nltsftb$p distr_type
R 835 5 183 tpm_distr nltsftb$o distr_type
R 837 5 185 tpm_distr nltsgtb distr_type
R 839 5 187 tpm_distr nltsgtb$sd distr_type
R 840 5 188 tpm_distr nltsgtb$p distr_type
R 841 5 189 tpm_distr nltsgtb$o distr_type
R 843 5 191 tpm_distr mstabf distr_type
R 845 5 193 tpm_distr mstabf$sd distr_type
R 846 5 194 tpm_distr mstabf$p distr_type
R 847 5 195 tpm_distr mstabf$o distr_type
R 849 5 197 tpm_distr nlengt0b distr_type
R 850 5 198 tpm_distr nlengt1b distr_type
R 851 5 199 tpm_distr ndgl_gp distr_type
R 852 5 200 tpm_distr nfrstlat distr_type
R 854 5 202 tpm_distr nfrstlat$sd distr_type
R 855 5 203 tpm_distr nfrstlat$p distr_type
R 856 5 204 tpm_distr nfrstlat$o distr_type
R 858 5 206 tpm_distr nlstlat distr_type
R 860 5 208 tpm_distr nlstlat$sd distr_type
R 861 5 209 tpm_distr nlstlat$p distr_type
R 862 5 210 tpm_distr nlstlat$o distr_type
R 864 5 212 tpm_distr nfrstloff distr_type
R 865 5 213 tpm_distr nptrlat distr_type
R 867 5 215 tpm_distr nptrlat$sd distr_type
R 868 5 216 tpm_distr nptrlat$p distr_type
R 869 5 217 tpm_distr nptrlat$o distr_type
R 871 5 219 tpm_distr nptrfrstlat distr_type
R 873 5 221 tpm_distr nptrfrstlat$sd distr_type
R 874 5 222 tpm_distr nptrfrstlat$p distr_type
R 875 5 223 tpm_distr nptrfrstlat$o distr_type
R 877 5 225 tpm_distr nptrlstlat distr_type
R 879 5 227 tpm_distr nptrlstlat$sd distr_type
R 880 5 228 tpm_distr nptrlstlat$p distr_type
R 881 5 229 tpm_distr nptrlstlat$o distr_type
R 883 5 231 tpm_distr nptrfloff distr_type
R 884 5 232 tpm_distr lsplitlat distr_type
R 886 5 234 tpm_distr lsplitlat$sd distr_type
R 887 5 235 tpm_distr lsplitlat$p distr_type
R 888 5 236 tpm_distr lsplitlat$o distr_type
R 890 5 238 tpm_distr nsta distr_type
R 893 5 241 tpm_distr nsta$sd distr_type
R 894 5 242 tpm_distr nsta$p distr_type
R 895 5 243 tpm_distr nsta$o distr_type
R 897 5 245 tpm_distr nonl distr_type
R 900 5 248 tpm_distr nonl$sd distr_type
R 901 5 249 tpm_distr nonl$p distr_type
R 902 5 250 tpm_distr nonl$o distr_type
R 904 5 252 tpm_distr ngptot distr_type
R 905 5 253 tpm_distr ngptotg distr_type
R 906 5 254 tpm_distr ngptotmx distr_type
R 907 5 255 tpm_distr ngptotl distr_type
R 910 5 258 tpm_distr ngptotl$sd distr_type
R 911 5 259 tpm_distr ngptotl$p distr_type
R 912 5 260 tpm_distr ngptotl$o distr_type
R 914 5 262 tpm_distr rweight distr_type
R 916 5 264 tpm_distr rweight$sd distr_type
R 917 5 265 tpm_distr rweight$p distr_type
R 918 5 266 tpm_distr rweight$o distr_type
R 920 5 268 tpm_distr nproca_gp distr_type
R 922 5 270 tpm_distr nproca_gp$sd distr_type
R 923 5 271 tpm_distr nproca_gp$p distr_type
R 924 5 272 tpm_distr nproca_gp$o distr_type
R 926 5 274 tpm_distr iadjust_d distr_type
R 927 5 275 tpm_distr iadjust_i distr_type
R 1040 6 24 tpm_trans ngpblks
S 1085 23 5 0 0 0 1088 624 9187 0 0 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 inigptr
S 1086 7 3 2 0 487 1 1085 9195 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kgptrsend
S 1087 7 3 2 0 490 1 1085 9205 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kgptrrecv
S 1088 14 5 0 0 0 1 1085 9187 200 400000 A 0 0 0 0 B 0 3 0 0 0 0 0 2 2 0 0 0 0 0 0 0 0 0 0 0 0 3 0 624 0 0 0 0 inigptr inigptr 
F 1088 2 1086 1087
S 1089 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1090 6 1 0 0 7 1 1085 9215 40800006 3000 A 0 0 0 0 B 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_600
S 1091 6 1 0 0 7 1 1085 9223 40800006 3000 A 0 0 0 0 B 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_604
S 1092 6 1 0 0 7 1 1085 9231 40800006 3000 A 0 0 0 0 B 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_602
S 1093 6 1 0 0 7 1 1085 9239 40800006 3000 A 0 0 0 0 B 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_607
S 1094 6 1 0 0 7 1 1085 9247 40800006 3000 A 0 0 0 0 B 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_610
A 27 2 0 0 0 7 642 0 0 0 27 0 0 0 0 0 0 0 0 0 0 0
A 113 2 0 0 0 7 648 0 0 0 113 0 0 0 0 0 0 0 0 0 0 0
A 561 1 0 0 278 7 1094 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 562 2 0 0 0 7 1089 0 0 0 562 0 0 0 0 0 0 0 0 0 0 0
A 563 1 0 0 0 6 1040 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 564 7 0 0 0 7 563 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 565 1 0 0 0 7 1090 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 566 1 0 0 491 6 660 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 567 7 0 0 0 7 566 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 568 1 0 0 0 7 1091 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 569 1 0 0 0 7 1092 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 570 1 0 0 360 7 1093 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
T 680 64 0 0 0 0
A 696 7 286 0 1 2 1
A 695 7 0 27 1 10 1
A 702 7 288 0 1 2 1
A 701 7 0 27 1 10 1
A 708 7 290 0 1 2 1
A 707 7 0 27 1 10 1
A 714 7 292 0 1 2 1
A 713 7 0 27 1 10 1
A 720 7 294 0 1 2 1
A 719 7 0 27 1 10 1
A 726 7 296 0 1 2 1
A 725 7 0 27 1 10 1
A 732 7 298 0 1 2 1
A 731 7 0 27 1 10 1
A 738 7 300 0 1 2 1
A 737 7 0 27 1 10 1
A 744 7 302 0 1 2 1
A 743 7 0 27 1 10 1
A 751 7 304 0 1 2 1
A 750 7 0 113 1 10 1
A 758 7 306 0 1 2 1
A 757 7 0 113 1 10 1
A 764 7 308 0 1 2 1
A 763 7 0 27 1 10 1
A 770 7 310 0 1 2 1
A 769 7 0 27 1 10 1
A 776 7 312 0 1 2 1
A 775 7 0 27 1 10 1
A 783 7 314 0 1 2 1
A 782 7 0 27 1 10 1
A 790 7 316 0 1 2 1
A 789 7 0 27 1 10 1
A 796 7 318 0 1 2 1
A 795 7 0 27 1 10 1
A 802 7 320 0 1 2 1
A 801 7 0 27 1 10 1
A 808 7 322 0 1 2 1
A 807 7 0 27 1 10 1
A 814 7 324 0 1 2 1
A 813 7 0 27 1 10 1
A 821 7 326 0 1 2 1
A 820 7 0 113 1 10 1
A 828 7 328 0 1 2 1
A 827 7 0 113 1 10 1
A 834 7 330 0 1 2 1
A 833 7 0 27 1 10 1
A 840 7 332 0 1 2 1
A 839 7 0 27 1 10 1
A 846 7 334 0 1 2 1
A 845 7 0 27 1 10 1
A 855 7 336 0 1 2 1
A 854 7 0 27 1 10 1
A 861 7 338 0 1 2 1
A 860 7 0 27 1 10 1
A 868 7 340 0 1 2 1
A 867 7 0 27 1 10 1
A 874 7 342 0 1 2 1
A 873 7 0 27 1 10 1
A 880 7 344 0 1 2 1
A 879 7 0 27 1 10 1
A 887 7 346 0 1 2 1
A 886 7 0 27 1 10 1
A 894 7 348 0 1 2 1
A 893 7 0 113 1 10 1
A 901 7 350 0 1 2 1
A 900 7 0 113 1 10 1
A 911 7 352 0 1 2 1
A 910 7 0 113 1 10 1
A 917 7 354 0 1 2 1
A 916 7 0 27 1 10 1
A 923 7 356 0 1 2 1
A 922 7 0 27 1 10 0
Z
