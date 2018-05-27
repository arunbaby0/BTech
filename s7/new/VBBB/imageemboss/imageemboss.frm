VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3390
   LinkTopic       =   "Form1"
   ScaleHeight     =   202
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   226
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Emboss effect"
      Height          =   495
      Left            =   1170
      TabIndex        =   2
      Top             =   1275
      Width           =   1215
   End
   Begin VB.PictureBox Picture2 
      AutoSize        =   -1  'True
      Height          =   690
      Left            =   540
      ScaleHeight     =   42
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   154
      TabIndex        =   1
      Top             =   1950
      Width           =   2370
   End
   Begin VB.PictureBox Picture1 
      Height          =   780
      Left            =   510
      Picture         =   "imageemboss.frx":0000
      ScaleHeight     =   48
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   152
      TabIndex        =   0
      Top             =   270
      Width           =   2340
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const intUpperBoundX = 300
Const intUpperBoundY = 300
Dim Pixels(1 To intUpperBoundX, 1 To intUpperBoundY) As Long
Private Sub Command1_Click()
    Dim x, y As Integer
    Dim bytRed, bytGreen, bytBlue, bytAverage As Integer
    
    For x = 1 To intUpperBoundX
        For y = 1 To intUpperBoundY
            Pixels(x, y) = Picture1.Point(x, y)
        Next y
    Next x
    
    For x = intUpperBoundX To 2 Step -1
        For y = intUpperBoundY To 2 Step -1
            bytRed = ((Pixels(x - 1, y - 1) And &HFF) - (Pixels(x, y) And &HFF)) + 128
            bytGreen = (((Pixels(x - 1, y - 1) And &HFF00) / &H100) Mod &H100 - ((Pixels(x, y) And &HFF00) / &H100) Mod &H100) + 128
            bytBlue = (((Pixels(x - 1, y - 1) And &HFF0000) / &H1000) Mod &H100 - ((Pixels(x, y) And &HFF0000) / &H10000) Mod &H100) + 128
            
            bytAverage = (bytRed + bytGreen + bytBlue) / 3
            Pixels(x, y) = RGB(bytAverage, bytAverage, bytAverage)
         Next y
    Next x
    
    
    For x = 1 To intUpperBoundX
        For y = 1 To intUpperBoundY
            Picture2.PSet (x - 2, y - 2), Pixels(x, y)
        Next y
    Next x
    
End Sub
