<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--
<xsl:param name="onebysize" select="0.1"/>
<xsl:param name="height" select="$size"/>
<xsl:param name="width" select="$size"/>
-->
<xsl:param name="size" select="9"/>
<xsl:param name="scale" select="0.11"/>
<xsl:param name="width" select="$size"/>
<xsl:param name="height" select="$size"/>
<xsl:template name="main" match="/">
  <div>
    <!-- Set Style -->
    <style type="text/css" media="all">
td.cell {
border: none;
border-collapse: collapse;
width:  <xsl:value-of select="$width * $scale"/>px;
height: <xsl:value-of select="$height * $scale"/>px;
background-color: #ECECEE;
padding: 0pt;
margin: 0pt;
}
td.cell div {
width:  <xsl:value-of select="$width * $scale"/>px;
height: <xsl:value-of select="$height * $scale"/>px;
margin: auto;
padding: 0pt;
border-collapse: separate;
border-style: hidden;
}
table.board {
background-color: #000000;
border-collapse: collapse;
border-style: hidden;
margin: <xsl:value-of select="$height * scale * 0.3"/>px;
}
img.piece {
width: <xsl:value-of select="$width * $scale"/>px;
height: <xsl:value-of select="$height * $scale"/>px;        
}
td.cell div.apple {
background-color: #7F9;
width:  <xsl:value-of select="$width * $scale * 0.8"/>px;
height: <xsl:value-of select="$height * $scale * 0.8"/>px;
}
td.cell div.coin {
background-color: #ccff33;
width:  <xsl:value-of select="$width * $scale * 0.8"/>px;
height: <xsl:value-of select="$height * $scale * 0.8"/>px;
}
td.cell div.wall {
background-color: #333;
}
td.cell div.redHead {
background-color: #C00;
}
td.cell div.blueHead {
background-color: #00C;
}
td.cell div.redBody {
background-color: #F85;
<!-- border: <xsl:value&#45;of select="$width * 0.01"/>px solid #eee; -->
}
td.cell div.blueBody {
background-color: #58F;
<!-- border: <xsl:value&#45;of select="$width * 0.01"/>px solid #eee; -->
}
td.cell div.redHeadWall {
background-color: #333;
border: <xsl:value-of select="$width * $scale * 0.2"/>px solid #C00;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
td.cell div.blueHeadWall {
background-color: #333;
border: <xsl:value-of select="$width * $scale * 0.2"/>px solid #C00;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
td.cell div.redHeadBlueHead {
background-color: #00C;
border: <xsl:value-of select="$width * $scale * 0.15"/>px solid #C00;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
td.cell div.redHeadBlueBody {
background-color: #58F;
border: <xsl:value-of select="$width * $scale * 0.15"/>px solid #C00;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
td.cell div.redHeadRedBody {
background-color: #F85;
border: <xsl:value-of select="$width * $scale * 0.15"/>px solid #C00;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
td.cell div.blueHeadBlueBody {
background-color: #58F;
border: <xsl:value-of select="$width * $scale * 0.15"/>px solid #00C;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
td.cell div.blueHeadRedBody {
background-color: #F85;
border: <xsl:value-of select="$width * $scale * 0.15"/>px solid #00C;
width:  <xsl:value-of select="$width * $scale * 0.72"/>px;
height: <xsl:value-of select="$height * $scale * 0.72"/>px;
}
</style>
    <!-- Draw Board -->
    <xsl:call-template name="board">
      <xsl:with-param name="cols" select="$size"/>
      <xsl:with-param name="rows" select="$size"/>
    </xsl:call-template>
  </div>
</xsl:template>
<xsl:template name="cell" match="state/fact">
  <xsl:param name="row" select="1"/>
  <xsl:param name="col" select="1"/>
  <td class="cell">
    <xsl:attribute name="id">
      <xsl:value-of select="'cell_'"/>
      <xsl:value-of select="$col"/>
      <xsl:value-of select="$row"/>
    </xsl:attribute>
    <div>
    <xsl:choose>
      <xsl:when test="//fact[relation='cell' and argument[3]='wall' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:choose>
          <xsl:when test="//fact[relation='cell' and argument[3]='redHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">redHeadWall</xsl:attribute>
          </xsl:when>
          <xsl:when test="//fact[relation='cell' and argument[3]='blueHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">blueHeadWall</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">wall</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="//fact[relation='cell' and argument[3]='blueBody' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:choose>
          <xsl:when test="//fact[relation='cell' and argument[3]='redHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">redHeadBlueBody</xsl:attribute>
          </xsl:when>
          <xsl:when test="//fact[relation='cell' and argument[3]='blueHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">blueHeadBlueBody</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">blueBody</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="//fact[relation='cell' and argument[3]='redBody' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:choose>
          <xsl:when test="//fact[relation='cell' and argument[3]='redHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">redHeadRedBody</xsl:attribute>
          </xsl:when>
          <xsl:when test="//fact[relation='cell' and argument[3]='blueHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">blueHeadRedBody</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">redBody</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="//fact[relation='cell' and argument[3]='redHead' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:choose>
          <xsl:when test="//fact[relation='cell' and argument[3]='blueHead' and argument[1]+1=$col and argument[2]+1=$row]">
            <xsl:attribute name="class">redHeadBlueHead</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">redHead</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="//fact[relation='cell' and argument[3]='blueHead' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:attribute name="class">blueHead</xsl:attribute>
      </xsl:when>
      <xsl:when test="//fact[relation='cell' and argument[3]='apple' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:attribute name="class">apple</xsl:attribute>
      </xsl:when>
      <xsl:when test="//fact[relation='cell' and argument[3]='coin' and argument[1]+1=$col and argument[2]+1=$row]">
        <xsl:attribute name="class">coin</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
</xsl:otherwise>
    </xsl:choose>
    </div>
  </td>
</xsl:template>
<xsl:template name="board_row">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="rows" select="1"/>
  <xsl:param name="row" select="1"/>
  <xsl:param name="col" select="1"/>
  <xsl:call-template name="cell">
    <xsl:with-param name="row" select="$row"/>
    <xsl:with-param name="col" select="$col"/>
  </xsl:call-template>
  <xsl:if test="$col &lt; $cols">
    <xsl:call-template name="board_row">
      <xsl:with-param name="cols" select="$cols"/>
      <xsl:with-param name="rows" select="$rows"/>
      <xsl:with-param name="row" select="$row"/>
      <xsl:with-param name="col" select="$col + 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>
<xsl:template name="board_rows">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="rows" select="1"/>
  <xsl:param name="row" select="1"/>
  <tr>
    <xsl:call-template name="board_row">
      <xsl:with-param name="cols" select="$cols"/>
      <xsl:with-param name="rows" select="$rows"/>
      <xsl:with-param name="row" select="$row"/>
    </xsl:call-template>
  </tr>
  <xsl:if test="$row &lt; $rows">
    <xsl:call-template name="board_rows">
      <xsl:with-param name="cols" select="$cols"/>
      <xsl:with-param name="rows" select="$rows"/>
      <xsl:with-param name="row" select="$row + 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>
<xsl:template name="board">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="rows" select="1"/>
  <table class="board">
    <xsl:call-template name="board_rows">
      <xsl:with-param name="cols" select="$cols"/>
      <xsl:with-param name="rows" select="$rows"/>
    </xsl:call-template>
  </table>
</xsl:template>
</xsl:stylesheet>
