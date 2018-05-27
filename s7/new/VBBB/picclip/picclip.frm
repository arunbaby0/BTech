VERSION 5.00
Object = "{27395F88-0C0C-101B-A3C9-08002B2F49FB}#1.1#0"; "PICCLP32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2115
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2955
   LinkTopic       =   "Form1"
   ScaleHeight     =   2115
   ScaleWidth      =   2955
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Get next cell"
      Height          =   495
      Left            =   1440
      TabIndex        =   2
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Clip next image"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   1440
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   975
      Left            =   360
      ScaleHeight     =   915
      ScaleWidth      =   2235
      TabIndex        =   0
      Top             =   240
      Width           =   2295
   End
   Begin PicClip.PictureClip PictureClip1 
      Left            =   120
      Top             =   2400
      _ExtentX        =   10874
      _ExtentY        =   1852
      _Version        =   393216
      Picture         =   "picclip.frx":0000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const intImageWidth = 137
Const intImageHeight = 70
Dim intImageIndex As Integer

Private Sub Command1_Click()
    intImageIndex = intImageIndex + 1
    If intImageIndex >= 3 Then intImageIndex = 0
    PictureClip1.ClipX = intImageIndex * intImageWidth
    Picture1.Picture = PictureClip1.Clip
End Sub

Private Sub Command2_Click()
    intImageIndex = intImageIndex + 1
    If intImageIndex >= 3 Then intImageIndex = 0
    Picture1.Picture = PictureClip1.GraphicCell(intImageIndex)
End Sub

Private Sub Form_Load()
    PictureClip1.ClipX = 0
    PictureClip1.ClipY = 0
    PictureClip1.ClipWidth = intImageWidth
    PictureClip1.ClipHeight = intImageHeight
    PictureClip1.Rows = 1
    PictureClip1.Cols = 3
    Picture1.Picture = PictureClip1.Clip
End Sub
