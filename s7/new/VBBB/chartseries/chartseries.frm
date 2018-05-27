VERSION 5.00
Object = "{02B5E320-7292-11CF-93D5-0020AF99504A}#1.1#0"; "MSCHART.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4965
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6405
   LinkTopic       =   "Form1"
   ScaleHeight     =   4965
   ScaleWidth      =   6405
   StartUpPosition =   3  'Windows Default
   Begin MSChartLib.MSChart MSChart1 
      Height          =   4215
      Left            =   120
      OleObjectBlob   =   "chartseries.frx":0000
      TabIndex        =   0
      Top             =   240
      Width           =   6015
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

Dim X(1 To 3, 1 To 6) As Variant

X(1, 2) = "Rice"
X(1, 3) = "Corn"
X(1, 4) = "Lentils"
X(1, 5) = "Wheat"
X(1, 6) = "Rye"

X(2, 1) = "January"
X(2, 2) = 2
X(2, 3) = 3
X(2, 4) = 4
X(2, 5) = 5
X(2, 6) = 6

X(3, 1) = "February"
X(3, 2) = 4
X(3, 3) = 6
X(3, 4) = 8
X(3, 5) = 10
X(3, 6) = 12

MSChart1.ChartData = X

End Sub
