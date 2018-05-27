VERSION 5.00
Object = "{02B5E320-7292-11CF-93D5-0020AF99504A}#1.1#0"; "MSCHART.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4080
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5460
   LinkTopic       =   "Form1"
   ScaleHeight     =   4080
   ScaleWidth      =   5460
   StartUpPosition =   3  'Windows Default
   Begin MSChartLib.MSChart MSChart1 
      Height          =   3495
      Left            =   120
      OleObjectBlob   =   "chart.frx":0000
      TabIndex        =   0
      Top             =   240
      Width           =   5175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

Dim X(1 To 5) As Variant
X(1) = "Data"
X(2) = 1
X(3) = 2
X(4) = 3
X(5) = 4

MSChart1.ChartData = X
End Sub
