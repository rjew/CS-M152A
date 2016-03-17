<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(11:0)" />
        <signal name="D(11:0)" />
        <signal name="XLXN_12" />
        <signal name="D(11)" />
        <signal name="XLXN_16(15:0)" />
        <port polarity="Output" name="S(11:0)" />
        <port polarity="Input" name="D(11:0)" />
        <port polarity="Output" name="D(11)" />
        <blockdef name="adsu16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="384" y1="-64" y2="-64" x1="240" />
            <line x2="240" y1="-124" y2="-64" x1="240" />
            <rect width="64" x="0" y="-204" height="24" />
            <rect width="64" x="0" y="-332" height="24" />
            <rect width="64" x="384" y="-268" height="24" />
            <line x2="64" y1="-448" y2="-448" x1="128" />
            <line x2="128" y1="-416" y2="-448" x1="128" />
            <line x2="48" y1="-64" y2="-64" x1="128" />
            <line x2="128" y1="-96" y2="-64" x1="128" />
            <line x2="64" y1="-288" y2="-432" x1="64" />
            <line x2="64" y1="-256" y2="-288" x1="128" />
            <line x2="128" y1="-224" y2="-256" x1="64" />
            <line x2="64" y1="-80" y2="-224" x1="64" />
            <line x2="64" y1="-160" y2="-80" x1="384" />
            <line x2="384" y1="-336" y2="-160" x1="384" />
            <line x2="384" y1="-352" y2="-336" x1="384" />
            <line x2="384" y1="-432" y2="-352" x1="64" />
            <line x2="336" y1="-128" y2="-148" x1="336" />
            <line x2="336" y1="-128" y2="-128" x1="384" />
            <line x2="384" y1="-256" y2="-256" x1="448" />
            <line x2="384" y1="-128" y2="-128" x1="448" />
            <line x2="384" y1="-64" y2="-64" x1="448" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="constant" name="XLXI_4">
            <attr value="0" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_16(15:0)" name="O" />
        </block>
        <block symbolname="adsu16" name="XLXI_1">
            <blockpin signalname="XLXN_16(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_12" name="ADD" />
            <blockpin signalname="D(11:0)" name="B(15:0)" />
            <blockpin signalname="D(11)" name="CI" />
            <blockpin name="CO" />
            <blockpin name="OFL" />
            <blockpin signalname="S(11:0)" name="S(15:0)" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="D(11)" name="I" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_12">
            <attr value="0" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="D(11)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="880" y="960" name="XLXI_1" orien="R0" />
        <branch name="S(11:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="704" type="branch" />
            <wire x2="1456" y1="704" y2="704" x1="1328" />
            <wire x2="1472" y1="704" y2="704" x1="1456" />
        </branch>
        <branch name="D(11:0)">
            <wire x2="880" y1="768" y2="768" x1="496" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="880" y1="896" y2="896" x1="752" />
        </branch>
        <instance x="528" y="928" name="XLXI_11" orien="R0" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="464" y="896" type="branch" />
            <wire x2="528" y1="896" y2="896" x1="464" />
        </branch>
        <branch name="D(11)">
            <wire x2="880" y1="512" y2="512" x1="752" />
        </branch>
        <instance x="448" y="608" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_16(15:0)">
            <wire x2="880" y1="640" y2="640" x1="592" />
        </branch>
        <iomarker fontsize="28" x="496" y="768" name="D(11:0)" orien="R180" />
        <instance x="608" y="480" name="XLXI_12" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1472" y="704" name="S(11:0)" orien="R0" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="352" type="branch" />
            <wire x2="1488" y1="352" y2="352" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="1488" y="352" name="D(11)" orien="R0" />
    </sheet>
</drawing>