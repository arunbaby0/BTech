VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2925
   LinkTopic       =   "Form1"
   ScaleHeight     =   202
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   195
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Grayscale effect"
      Height          =   495
      Left            =   705
      TabIndex        =   2
      Top             =   1260
      Width           =   1350
   End
   Begin VB.PictureBox Picture2 
      AutoSize        =   -1  'True
      Height          =   735
      Left            =   240
      ScaleHeight     =   45
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   154
      TabIndex        =   1
      Top             =   1950
      Width           =   2370
   End
   Begin VB.PictureBox Picture1 
      Height          =   780
      Left            =   210
      Picture         =   "imagegrayscale.frx":0000
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
    
    For x = 1 To intUpperBoundX
        For y = 1 To intUpperBoundY
            bytRed = Pixels(x, y) And &HFF
            bytGreen = ((Pixels(x, y) And &HFF00) / &H100) Mod &H100
            bytBlue = ((Pixels(x, y) And &HFF0000) / &H10000) Mod &H100
            
            bytAverage = (bytRed + bytGreen + bytBlue) / 3
            Pixels(x, y) = RGB(bytAverage, bytAverage, bytAverage)
         Next y
    Next x
    
    
    For x = 1 To intUpperBoundX
        For y = 1 To intUpperBoundY
            Picture2.PSet (x, y), Pixels(x, y)
        Next y
    Next x
    
End Sub
