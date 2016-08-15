Problem:    maxflow
Rows:       26
Columns:    85
Non-zeros:  171
Status:     OPTIMAL
Objective:  total_flow = 1100 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 total_flow   B           1100                             
     2 source_flow  NS             0            -0             =             1 
     3 sink_flow    NS             0            -0             =         < eps
     4 flow_conservation[Boundary1st]
                    NS             0            -0             =         < eps
     5 flow_conservation[BoundaryHastings]
                    NS             0            -0             =         < eps
     6 flow_conservation[BroadwayClark]
                    NS             0            -0             =         < eps
     7 flow_conservation[Cambie41st]
                    NS             0            -0             =         < eps
     8 flow_conservation[CambieBroadway]
                    NS             0            -0             =         < eps
     9 flow_conservation[Clark1st]
                    NS             0            -0             =         < eps
    10 flow_conservation[Downtown]
                    NS             0            -0             =         < eps
    11 flow_conservation[Granville41st]
                    NS             0            -0             =         < eps
    12 flow_conservation[GranvilleBroadway]
                    NS             0            -0             =         < eps
    13 flow_conservation[HastingsClark]
                    NS             0            -0             =         < eps
    14 flow_conservation[KingswayBroadway]
                    NS             0            -0             =         < eps
    15 flow_conservation[KingswayKnight]
                    NS             0            -0             =         < eps
    16 flow_conservation[Knight41st]
                    NS             0            -0             =         < eps
    17 flow_conservation[KnightMarine]
                    NS             0            -0             =         < eps
    18 flow_conservation[LougheedBoundary]
                    NS             0            -0             =         < eps
    19 flow_conservation[MainTerminal]
                    NS             0            -0             =         < eps
    20 flow_conservation[Marine41st]
                    NS             0            -0             =         < eps
    21 flow_conservation[MarineBoundary]
                    NS             0            -0             =         < eps
    22 flow_conservation[MarineCambie]
                    NS             0            -0             =         < eps
    23 flow_conservation[MarineGranville]
                    NS             0            -0             =         < eps
    24 flow_conservation[MarineOak]
                    NS             0            -0             =         < eps
    25 flow_conservation[Oak41st]
                    NS             0            -0             =         < eps
    26 flow_conservation[OakBroadway]
                    B              0            -0             = 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 Flow[KingswayBoundary,KingswayKnight]
                    NU           300             0           300             1 
     2 Flow[KingswayBoundary,Knight41st]
                    NU           600             0           600             1 
     3 Flow[KingswayBoundary,LougheedBoundary]
                    NU           200             0           200             1 
     4 Flow[KingswayBoundary,MarineBoundary]
                    NS             0             0             =             1 
     5 Flow[KingswayKnight,KingswayBoundary]
                    NL             0             0           300            -1 
     6 Flow[Knight41st,KingswayBoundary]
                    NL             0             0           600            -1 
     7 Flow[LougheedBoundary,KingswayBoundary]
                    NL             0             0           200            -1 
     8 Flow[MarineBoundary,KingswayBoundary]
                    NS             0             0             =            -1 
     9 Flow[UBC,GranvilleBroadway]
                    NL             0             0          2900         < eps
    10 Flow[UBC,Marine41st]
                    NL             0             0          1400         < eps
    11 Flow[GranvilleBroadway,UBC]
                    B            500             0          2900 
    12 Flow[Marine41st,UBC]
                    B            600             0          1400 
    13 Flow[Boundary1st,BoundaryHastings]
                    B            200             0           200 
    14 Flow[Boundary1st,Clark1st]
                    NS             0             0             =         < eps
    15 Flow[Boundary1st,LougheedBoundary]
                    NL             0             0           200         < eps
    16 Flow[BoundaryHastings,Boundary1st]
                    NL             0             0           200         < eps
    17 Flow[Clark1st,Boundary1st]
                    NS             0             0             =         < eps
    18 Flow[LougheedBoundary,Boundary1st]
                    B            200             0           200 
    19 Flow[BoundaryHastings,HastingsClark]
                    B            200             0           600 
    20 Flow[HastingsClark,BoundaryHastings]
                    NL             0             0           600         < eps
    21 Flow[BroadwayClark,Clark1st]
                    B              0             0           600 
    22 Flow[BroadwayClark,KingswayBroadway]
                    B              0             0          2600 
    23 Flow[BroadwayClark,KingswayKnight]
                    NL             0             0           600         < eps
    24 Flow[BroadwayClark,LougheedBoundary]
                    NL             0             0           600         < eps
    25 Flow[Clark1st,BroadwayClark]
                    NL             0             0           600         < eps
    26 Flow[KingswayBroadway,BroadwayClark]
                    NL             0             0          2600         < eps
    27 Flow[KingswayKnight,BroadwayClark]
                    B              0             0           600 
    28 Flow[LougheedBoundary,BroadwayClark]
                    NL             0             0           600         < eps
    29 Flow[Cambie41st,CambieBroadway]
                    NL             0             0           200         < eps
    30 Flow[Cambie41st,Knight41st]
                    NL             0             0           600         < eps
    31 Flow[Cambie41st,MarineCambie]
                    B              0             0           200 
    32 Flow[Cambie41st,Oak41st]
                    B            600             0           600 
    33 Flow[CambieBroadway,Cambie41st]
                    NL             0             0           200         < eps
    34 Flow[Knight41st,Cambie41st]
                    NU           600             0           600         < eps
    35 Flow[MarineCambie,Cambie41st]
                    NL             0             0           200         < eps
    36 Flow[Oak41st,Cambie41st]
                    NL             0             0           600         < eps
    37 Flow[CambieBroadway,Downtown]
                    NL             0             0           500         < eps
    38 Flow[CambieBroadway,KingswayBroadway]
                    NL             0             0          2600         < eps
    39 Flow[CambieBroadway,OakBroadway]
                    B              0             0          2900 
    40 Flow[Downtown,CambieBroadway]
                    NL             0             0           500         < eps
    41 Flow[KingswayBroadway,CambieBroadway]
                    B              0             0          2600 
    42 Flow[OakBroadway,CambieBroadway]
                    NL             0             0          2900         < eps
    43 Flow[Clark1st,HastingsClark]
                    NS             0             0             =         < eps
    44 Flow[Clark1st,MainTerminal]
                    NL             0             0           600         < eps
    45 Flow[HastingsClark,Clark1st]
                    NS             0             0             =         < eps
    46 Flow[MainTerminal,Clark1st]
                    NL             0             0           600         < eps
    47 Flow[Downtown,GranvilleBroadway]
                    B            500             0           900 
    48 Flow[Downtown,HastingsClark]
                    NL             0             0           600         < eps
    49 Flow[Downtown,MainTerminal]
                    NL             0             0           900         < eps
    50 Flow[GranvilleBroadway,Downtown]
                    NL             0             0           900         < eps
    51 Flow[HastingsClark,Downtown]
                    B            200             0           600 
    52 Flow[MainTerminal,Downtown]
                    B            300             0           900 
    53 Flow[Granville41st,GranvilleBroadway]
                    NL             0             0           600         < eps
    54 Flow[Granville41st,Marine41st]
                    B            600             0          1400 
    55 Flow[Granville41st,MarineGranville]
                    NL             0             0          1400         < eps
    56 Flow[Granville41st,Oak41st]
                    NL             0             0           600         < eps
    57 Flow[GranvilleBroadway,Granville41st]
                    NL             0             0           600         < eps
    58 Flow[Marine41st,Granville41st]
                    NL             0             0          1400         < eps
    59 Flow[MarineGranville,Granville41st]
                    NL             0             0          1400         < eps
    60 Flow[Oak41st,Granville41st]
                    B            600             0           600 
    61 Flow[GranvilleBroadway,OakBroadway]
                    NL             0             0          2600         < eps
    62 Flow[OakBroadway,GranvilleBroadway]
                    B              0             0          2600 
    63 Flow[KingswayBroadway,KingswayKnight]
                    NL             0             0           300         < eps
    64 Flow[KingswayBroadway,MainTerminal]
                    NU           300             0           300         < eps
    65 Flow[KingswayKnight,KingswayBroadway]
                    NU           300             0           300         < eps
    66 Flow[MainTerminal,KingswayBroadway]
                    NL             0             0           300         < eps
    67 Flow[KingswayKnight,Knight41st]
                    NL             0             0           600         < eps
    68 Flow[Knight41st,KingswayKnight]
                    B              0             0           600 
    69 Flow[Knight41st,KnightMarine]
                    B              0             0           600 
    70 Flow[KnightMarine,Knight41st]
                    NL             0             0           600         < eps
    71 Flow[KnightMarine,MarineBoundary]
                    NL             0             0           300         < eps
    72 Flow[KnightMarine,MarineCambie]
                    NL             0             0           300         < eps
    73 Flow[MarineBoundary,KnightMarine]
                    B              0             0           300 
    74 Flow[MarineCambie,KnightMarine]
                    NL             0             0           300         < eps
    75 Flow[Marine41st,MarineGranville]
                    NS             0             0             =         < eps
    76 Flow[MarineGranville,Marine41st]
                    NS             0             0             =         < eps
    77 Flow[MarineCambie,MarineOak]
                    NL             0             0          1200         < eps
    78 Flow[MarineOak,MarineCambie]
                    NL             0             0          1200         < eps
    79 Flow[MarineGranville,MarineOak]
                    NL             0             0          1700         < eps
    80 Flow[MarineOak,MarineGranville]
                    B              0             0          1700 
    81 Flow[MarineOak,Oak41st]
                    NL             0             0           300         < eps
    82 Flow[Oak41st,MarineOak]
                    B              0             0           300 
    83 Flow[Oak41st,OakBroadway]
                    NL             0             0           300         < eps
    84 Flow[OakBroadway,Oak41st]
                    NL             0             0           300         < eps
    85 f            B           1100             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 0.00e+00 on column 0
        max.rel.err = 0.00e+00 on column 0
        High quality

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
