V34 :0x24 spnsde_mod
14 spnsde_mod.F90 S624 0
02/16/2022  17:28:20
use tpm_dim private
use tpm_distr private
enduse
D 58 26 652 56 651 3
D 85 26 720 5640 719 7
D 307 22 7
D 309 22 7
D 311 22 7
D 313 22 7
D 315 22 7
D 317 22 7
D 319 22 7
D 321 22 7
D 323 22 7
D 325 22 7
D 327 22 7
D 329 22 7
D 331 22 7
D 333 22 7
D 335 22 7
D 337 22 7
D 339 22 7
D 341 22 7
D 343 22 7
D 345 22 7
D 347 22 7
D 349 22 7
D 351 22 7
D 353 22 7
D 355 22 7
D 357 22 7
D 359 22 7
D 361 22 7
D 363 22 7
D 365 22 7
D 367 22 7
D 369 22 7
D 371 22 7
D 373 22 7
D 375 22 7
D 377 22 7
D 472 23 10 2 483 496 0 0 1 0 0
 11 487 11 11 488 488
 10 493 488 10 494 495
D 475 23 10 3 497 506 1 1 0 0 1
 11 498 11 11 498 499
 11 500 501 11 500 502
 11 503 504 11 503 505
D 478 23 10 3 507 516 1 1 0 0 1
 11 508 11 11 508 509
 11 510 511 11 510 512
 11 513 514 11 513 515
S 624 24 0 0 0 9 1 0 5013 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 spnsde_mod
S 626 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 642 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 651 25 3 tpm_dim dim_type
R 652 5 4 tpm_dim nsmax dim_type
R 653 5 5 tpm_dim ntmax dim_type
R 654 5 6 tpm_dim nspoleg dim_type
R 655 5 7 tpm_dim nspec_g dim_type
R 656 5 8 tpm_dim nspec2_g dim_type
R 657 5 9 tpm_dim ndgl dim_type
R 658 5 10 tpm_dim ndlon dim_type
R 659 5 11 tpm_dim ndgnh dim_type
R 660 5 12 tpm_dim nlei1 dim_type
R 661 5 13 tpm_dim nlei3 dim_type
R 662 5 14 tpm_dim nled3 dim_type
R 663 5 15 tpm_dim nled4 dim_type
R 664 5 16 tpm_dim nnoextzl dim_type
R 665 5 17 tpm_dim nnoextzg dim_type
R 675 6 27 tpm_dim r
S 688 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 719 25 28 tpm_distr distr_type
R 720 5 29 tpm_distr lgridonly distr_type
R 721 5 30 tpm_distr lweighted_distr distr_type
R 722 5 31 tpm_distr lsplit distr_type
R 723 5 32 tpm_distr lcpnmonly distr_type
R 724 5 33 tpm_distr nump distr_type
R 725 5 34 tpm_distr nspec distr_type
R 726 5 35 tpm_distr nspec2 distr_type
R 727 5 36 tpm_distr nspec2mx distr_type
R 728 5 37 tpm_distr ntpec2 distr_type
R 729 5 38 tpm_distr numtp distr_type
R 730 5 39 tpm_distr nspolegl distr_type
R 731 5 40 tpm_distr nlei3d distr_type
R 732 5 41 tpm_distr myms distr_type
R 734 5 43 tpm_distr myms$sd distr_type
R 735 5 44 tpm_distr myms$p distr_type
R 736 5 45 tpm_distr myms$o distr_type
R 738 5 47 tpm_distr numpp distr_type
R 740 5 49 tpm_distr numpp$sd distr_type
R 741 5 50 tpm_distr numpp$p distr_type
R 742 5 51 tpm_distr numpp$o distr_type
R 744 5 53 tpm_distr npossp distr_type
R 746 5 55 tpm_distr npossp$sd distr_type
R 747 5 56 tpm_distr npossp$p distr_type
R 748 5 57 tpm_distr npossp$o distr_type
R 750 5 59 tpm_distr nprocm distr_type
R 752 5 61 tpm_distr nprocm$sd distr_type
R 753 5 62 tpm_distr nprocm$p distr_type
R 754 5 63 tpm_distr nprocm$o distr_type
R 756 5 65 tpm_distr ndim0g distr_type
R 758 5 67 tpm_distr ndim0g$sd distr_type
R 759 5 68 tpm_distr ndim0g$p distr_type
R 760 5 69 tpm_distr ndim0g$o distr_type
R 762 5 71 tpm_distr nasm0 distr_type
R 764 5 73 tpm_distr nasm0$sd distr_type
R 765 5 74 tpm_distr nasm0$p distr_type
R 766 5 75 tpm_distr nasm0$o distr_type
R 768 5 77 tpm_distr natm0 distr_type
R 770 5 79 tpm_distr natm0$sd distr_type
R 771 5 80 tpm_distr natm0$p distr_type
R 772 5 81 tpm_distr natm0$o distr_type
R 774 5 83 tpm_distr nallms distr_type
R 776 5 85 tpm_distr nallms$sd distr_type
R 777 5 86 tpm_distr nallms$p distr_type
R 778 5 87 tpm_distr nallms$o distr_type
R 780 5 89 tpm_distr nptrms distr_type
R 782 5 91 tpm_distr nptrms$sd distr_type
R 783 5 92 tpm_distr nptrms$p distr_type
R 784 5 93 tpm_distr nptrms$o distr_type
R 786 5 95 tpm_distr nlatls distr_type
R 789 5 98 tpm_distr nlatls$sd distr_type
R 790 5 99 tpm_distr nlatls$p distr_type
R 791 5 100 tpm_distr nlatls$o distr_type
R 793 5 102 tpm_distr nlatle distr_type
R 796 5 105 tpm_distr nlatle$sd distr_type
R 797 5 106 tpm_distr nlatle$p distr_type
R 798 5 107 tpm_distr nlatle$o distr_type
R 800 5 109 tpm_distr npmt distr_type
R 802 5 111 tpm_distr npmt$sd distr_type
R 803 5 112 tpm_distr npmt$p distr_type
R 804 5 113 tpm_distr npmt$o distr_type
R 806 5 115 tpm_distr npms distr_type
R 808 5 117 tpm_distr npms$sd distr_type
R 809 5 118 tpm_distr npms$p distr_type
R 810 5 119 tpm_distr npms$o distr_type
R 812 5 121 tpm_distr npmg distr_type
R 814 5 123 tpm_distr npmg$sd distr_type
R 815 5 124 tpm_distr npmg$p distr_type
R 816 5 125 tpm_distr npmg$o distr_type
R 818 5 127 tpm_distr ndgl_fs distr_type
R 819 5 128 tpm_distr nstagtf distr_type
R 821 5 130 tpm_distr nstagtf$sd distr_type
R 822 5 131 tpm_distr nstagtf$p distr_type
R 823 5 132 tpm_distr nstagtf$o distr_type
R 825 5 134 tpm_distr nlengtf distr_type
R 826 5 135 tpm_distr nultpp distr_type
R 828 5 137 tpm_distr nultpp$sd distr_type
R 829 5 138 tpm_distr nultpp$p distr_type
R 830 5 139 tpm_distr nultpp$o distr_type
R 832 5 141 tpm_distr nprocl distr_type
R 834 5 143 tpm_distr nprocl$sd distr_type
R 835 5 144 tpm_distr nprocl$p distr_type
R 836 5 145 tpm_distr nprocl$o distr_type
R 838 5 147 tpm_distr nptrls distr_type
R 840 5 149 tpm_distr nptrls$sd distr_type
R 841 5 150 tpm_distr nptrls$p distr_type
R 842 5 151 tpm_distr nptrls$o distr_type
R 844 5 153 tpm_distr nstagt0b distr_type
R 846 5 155 tpm_distr nstagt0b$sd distr_type
R 847 5 156 tpm_distr nstagt0b$p distr_type
R 848 5 157 tpm_distr nstagt0b$o distr_type
R 850 5 159 tpm_distr nstagt1b distr_type
R 852 5 161 tpm_distr nstagt1b$sd distr_type
R 853 5 162 tpm_distr nstagt1b$p distr_type
R 854 5 163 tpm_distr nstagt1b$o distr_type
R 856 5 165 tpm_distr npntgtb0 distr_type
R 859 5 168 tpm_distr npntgtb0$sd distr_type
R 860 5 169 tpm_distr npntgtb0$p distr_type
R 861 5 170 tpm_distr npntgtb0$o distr_type
R 863 5 172 tpm_distr npntgtb1 distr_type
R 866 5 175 tpm_distr npntgtb1$sd distr_type
R 867 5 176 tpm_distr npntgtb1$p distr_type
R 868 5 177 tpm_distr npntgtb1$o distr_type
R 870 5 179 tpm_distr nltsftb distr_type
R 872 5 181 tpm_distr nltsftb$sd distr_type
R 873 5 182 tpm_distr nltsftb$p distr_type
R 874 5 183 tpm_distr nltsftb$o distr_type
R 876 5 185 tpm_distr nltsgtb distr_type
R 878 5 187 tpm_distr nltsgtb$sd distr_type
R 879 5 188 tpm_distr nltsgtb$p distr_type
R 880 5 189 tpm_distr nltsgtb$o distr_type
R 882 5 191 tpm_distr mstabf distr_type
R 884 5 193 tpm_distr mstabf$sd distr_type
R 885 5 194 tpm_distr mstabf$p distr_type
R 886 5 195 tpm_distr mstabf$o distr_type
R 888 5 197 tpm_distr nlengt0b distr_type
R 889 5 198 tpm_distr nlengt1b distr_type
R 890 5 199 tpm_distr ndgl_gp distr_type
R 891 5 200 tpm_distr nfrstlat distr_type
R 893 5 202 tpm_distr nfrstlat$sd distr_type
R 894 5 203 tpm_distr nfrstlat$p distr_type
R 895 5 204 tpm_distr nfrstlat$o distr_type
R 897 5 206 tpm_distr nlstlat distr_type
R 899 5 208 tpm_distr nlstlat$sd distr_type
R 900 5 209 tpm_distr nlstlat$p distr_type
R 901 5 210 tpm_distr nlstlat$o distr_type
R 903 5 212 tpm_distr nfrstloff distr_type
R 904 5 213 tpm_distr nptrlat distr_type
R 906 5 215 tpm_distr nptrlat$sd distr_type
R 907 5 216 tpm_distr nptrlat$p distr_type
R 908 5 217 tpm_distr nptrlat$o distr_type
R 910 5 219 tpm_distr nptrfrstlat distr_type
R 912 5 221 tpm_distr nptrfrstlat$sd distr_type
R 913 5 222 tpm_distr nptrfrstlat$p distr_type
R 914 5 223 tpm_distr nptrfrstlat$o distr_type
R 916 5 225 tpm_distr nptrlstlat distr_type
R 918 5 227 tpm_distr nptrlstlat$sd distr_type
R 919 5 228 tpm_distr nptrlstlat$p distr_type
R 920 5 229 tpm_distr nptrlstlat$o distr_type
R 922 5 231 tpm_distr nptrfloff distr_type
R 923 5 232 tpm_distr lsplitlat distr_type
R 925 5 234 tpm_distr lsplitlat$sd distr_type
R 926 5 235 tpm_distr lsplitlat$p distr_type
R 927 5 236 tpm_distr lsplitlat$o distr_type
R 929 5 238 tpm_distr nsta distr_type
R 932 5 241 tpm_distr nsta$sd distr_type
R 933 5 242 tpm_distr nsta$p distr_type
R 934 5 243 tpm_distr nsta$o distr_type
R 936 5 245 tpm_distr nonl distr_type
R 939 5 248 tpm_distr nonl$sd distr_type
R 940 5 249 tpm_distr nonl$p distr_type
R 941 5 250 tpm_distr nonl$o distr_type
R 943 5 252 tpm_distr ngptot distr_type
R 944 5 253 tpm_distr ngptotg distr_type
R 945 5 254 tpm_distr ngptotmx distr_type
R 946 5 255 tpm_distr ngptotl distr_type
R 949 5 258 tpm_distr ngptotl$sd distr_type
R 950 5 259 tpm_distr ngptotl$p distr_type
R 951 5 260 tpm_distr ngptotl$o distr_type
R 953 5 262 tpm_distr rweight distr_type
R 955 5 264 tpm_distr rweight$sd distr_type
R 956 5 265 tpm_distr rweight$p distr_type
R 957 5 266 tpm_distr rweight$o distr_type
R 959 5 268 tpm_distr nproca_gp distr_type
R 961 5 270 tpm_distr nproca_gp$sd distr_type
R 962 5 271 tpm_distr nproca_gp$p distr_type
R 963 5 272 tpm_distr nproca_gp$o distr_type
R 965 5 274 tpm_distr iadjust_d distr_type
R 966 5 275 tpm_distr iadjust_i distr_type
R 1046 6 355 tpm_distr d
S 1053 23 5 0 0 0 1058 624 8963 0 0 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 spnsde
S 1054 1 3 1 0 6 1 1053 8970 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kf_scalars
S 1055 7 3 1 0 472 1 1053 8981 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pepsnm
S 1056 7 3 1 0 475 1 1053 8988 20000004 10003000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pf
S 1057 7 3 2 0 478 1 1053 8991 20000004 10003000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pnsd
S 1058 14 5 0 0 0 1 1053 8963 20000200 400000 A 0 0 0 0 B 0 3 0 0 0 0 0 2 4 0 0 0 0 0 0 0 0 0 0 0 0 3 0 624 0 0 0 0 spnsde spnsde 
F 1058 4 1054 1055 1056 1057
S 1059 6 1 0 0 7 1 1053 8996 40800006 3000 A 0 0 0 0 B 0 71 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1065
S 1060 6 1 0 0 7 1 1053 9005 40800006 3000 A 0 0 0 0 B 0 71 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1070
S 1061 6 1 0 0 7 1 1053 9014 40800006 3000 A 0 0 0 0 B 0 71 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1073
S 1062 6 1 0 0 7 1 1053 9023 40800006 3000 A 0 0 0 0 B 0 71 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1075
S 1063 6 1 0 0 7 1 1053 9032 40800006 3000 A 0 0 0 0 B 0 71 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_11
S 1064 6 1 0 0 7 1 1053 9039 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_1_1
S 1065 6 1 0 0 7 1 1053 9047 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_2_1
S 1066 6 1 0 0 7 1 1053 9055 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_4_1
S 1067 6 1 0 0 7 1 1053 9063 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_5_1
S 1068 6 1 0 0 7 1 1053 9071 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_7_1
S 1069 6 1 0 0 7 1 1053 9079 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_8_1
S 1070 6 1 0 0 7 1 1053 9087 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_9_1
S 1071 6 1 0 0 7 1 1053 9095 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1089
S 1072 6 1 0 0 7 1 1053 9104 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1092
S 1073 6 1 0 0 7 1 1053 9113 40800006 3000 A 0 0 0 0 B 0 72 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1095
S 1074 6 1 0 0 7 1 1053 9122 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_11_1
S 1075 6 1 0 0 7 1 1053 9131 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_12_1
S 1076 6 1 0 0 7 1 1053 9140 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_14_1
S 1077 6 1 0 0 7 1 1053 9149 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_15_1
S 1078 6 1 0 0 7 1 1053 9158 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_17_1
S 1079 6 1 0 0 7 1 1053 9167 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_18_1
S 1080 6 1 0 0 7 1 1053 9176 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_19_1
S 1081 6 1 0 0 7 1 1053 9185 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1108
S 1082 6 1 0 0 7 1 1053 9194 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1111
S 1083 6 1 0 0 7 1 1053 9203 40800006 3000 A 0 0 0 0 B 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1114
A 14 2 0 0 0 6 626 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0
A 27 2 0 0 0 7 642 0 0 0 27 0 0 0 0 0 0 0 0 0 0 0
A 122 2 0 0 0 7 688 0 0 0 122 0 0 0 0 0 0 0 0 0 0 0
A 483 1 0 0 0 7 1063 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 484 1 0 0 0 85 1046 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 485 1 0 0 11 6 724 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 486 9 0 0 0 6 484 485 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 487 7 0 0 0 7 486 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 488 1 0 0 0 7 1059 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 489 1 0 0 289 58 675 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 490 1 0 0 0 6 653 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 491 9 0 0 134 6 489 490 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 492 4 0 0 392 6 491 0 14 0 0 0 0 1 0 0 0 0 0 0 0 0
A 493 7 0 0 0 7 492 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 494 1 0 0 0 7 1060 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 495 1 0 0 434 7 1061 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 496 1 0 0 0 7 1062 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 497 1 0 0 135 7 1070 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 498 1 0 0 422 7 1064 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 499 1 0 0 0 7 1071 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 500 1 0 0 65 7 1066 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 501 1 0 0 0 7 1065 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 502 1 0 0 0 7 1072 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 503 1 0 0 0 7 1068 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 504 1 0 0 456 7 1067 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 505 1 0 0 0 7 1073 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 506 1 0 0 442 7 1069 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 507 1 0 0 0 7 1080 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 508 1 0 0 73 7 1074 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 509 1 0 0 0 7 1081 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 510 1 0 0 0 7 1076 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 511 1 0 0 366 7 1075 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 512 1 0 0 455 7 1082 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 513 1 0 0 216 7 1078 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 514 1 0 0 450 7 1077 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 515 1 0 0 0 7 1083 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 516 1 0 0 0 7 1079 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
T 719 85 0 0 0 0
A 735 7 307 0 1 2 1
A 734 7 0 27 1 10 1
A 741 7 309 0 1 2 1
A 740 7 0 27 1 10 1
A 747 7 311 0 1 2 1
A 746 7 0 27 1 10 1
A 753 7 313 0 1 2 1
A 752 7 0 27 1 10 1
A 759 7 315 0 1 2 1
A 758 7 0 27 1 10 1
A 765 7 317 0 1 2 1
A 764 7 0 27 1 10 1
A 771 7 319 0 1 2 1
A 770 7 0 27 1 10 1
A 777 7 321 0 1 2 1
A 776 7 0 27 1 10 1
A 783 7 323 0 1 2 1
A 782 7 0 27 1 10 1
A 790 7 325 0 1 2 1
A 789 7 0 122 1 10 1
A 797 7 327 0 1 2 1
A 796 7 0 122 1 10 1
A 803 7 329 0 1 2 1
A 802 7 0 27 1 10 1
A 809 7 331 0 1 2 1
A 808 7 0 27 1 10 1
A 815 7 333 0 1 2 1
A 814 7 0 27 1 10 1
A 822 7 335 0 1 2 1
A 821 7 0 27 1 10 1
A 829 7 337 0 1 2 1
A 828 7 0 27 1 10 1
A 835 7 339 0 1 2 1
A 834 7 0 27 1 10 1
A 841 7 341 0 1 2 1
A 840 7 0 27 1 10 1
A 847 7 343 0 1 2 1
A 846 7 0 27 1 10 1
A 853 7 345 0 1 2 1
A 852 7 0 27 1 10 1
A 860 7 347 0 1 2 1
A 859 7 0 122 1 10 1
A 867 7 349 0 1 2 1
A 866 7 0 122 1 10 1
A 873 7 351 0 1 2 1
A 872 7 0 27 1 10 1
A 879 7 353 0 1 2 1
A 878 7 0 27 1 10 1
A 885 7 355 0 1 2 1
A 884 7 0 27 1 10 1
A 894 7 357 0 1 2 1
A 893 7 0 27 1 10 1
A 900 7 359 0 1 2 1
A 899 7 0 27 1 10 1
A 907 7 361 0 1 2 1
A 906 7 0 27 1 10 1
A 913 7 363 0 1 2 1
A 912 7 0 27 1 10 1
A 919 7 365 0 1 2 1
A 918 7 0 27 1 10 1
A 926 7 367 0 1 2 1
A 925 7 0 27 1 10 1
A 933 7 369 0 1 2 1
A 932 7 0 122 1 10 1
A 940 7 371 0 1 2 1
A 939 7 0 122 1 10 1
A 950 7 373 0 1 2 1
A 949 7 0 122 1 10 1
A 956 7 375 0 1 2 1
A 955 7 0 27 1 10 1
A 962 7 377 0 1 2 1
A 961 7 0 27 1 10 0
Z
