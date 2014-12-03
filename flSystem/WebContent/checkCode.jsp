<%@ page import = "java.awt.Color" %>
<%@ page import = "java.awt.Font" %>
<%@ page import = "java.awt.Graphics" %>
<%@ page import = "java.awt.image.BufferedImage" %>
<%@ page import = "java.util.Random" %>
<%@ page import = "javax.imageio.ImageIO" %>
<%
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

char imgString[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F','G','H','I','J','k'};

int imgWidth = 110;
int imgHeight = 20;

BufferedImage imgImage = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_RGB);
Graphics imgGraphics = imgImage.createGraphics();
Random imgRandom = new Random();
imgGraphics.setColor(new Color(255, 255, 255));
imgGraphics.fillRect(0, 0, imgWidth, imgHeight);
imgGraphics.setFont(new Font("Verdana", Font.BOLD, 22));

String imgRandString = "";

for(int i = 0; i < 6; i ++)
{
  String imgRandStr = String.valueOf(imgString[imgRandom.nextInt(imgString.length)]);
  imgRandString += imgRandStr;
  imgGraphics.setColor(new Color(20 + imgRandom.nextInt(80), 20 + imgRandom.nextInt(100), 20 + imgRandom.nextInt(90)));
  imgGraphics.drawString(imgRandStr, (14 + imgRandom.nextInt(3)) * i + 5, 20);
  for(int k = 0; k < 5; k ++)
  {
    int imgX = imgRandom.nextInt(imgWidth);
    int imgY = imgRandom.nextInt(imgHeight);
    int imgX1 = imgRandom.nextInt(3);
    int imgY1 = imgRandom.nextInt(3);
    imgGraphics.drawLine(imgX, imgY, imgX + imgX1, imgY + imgY1);
  }
}

request.getSession().setAttribute("valcode", imgRandString);

imgGraphics.dispose();

out.clear();
ImageIO.write(imgImage, "JPG", response.getOutputStream());
%>