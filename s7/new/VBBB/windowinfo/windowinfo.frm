VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4755
   ClientLeft      =   1425
   ClientTop       =   2175
   ClientWidth     =   6495
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   317
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   433
   Begin VB.TextBox Text1 
      Height          =   3015
      Left            =   600
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   360
      Width           =   5295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Choose window"
      Height          =   495
      Left            =   2280
      TabIndex        =   0
      Top             =   4080
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim blnChoose As Boolean

Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long

Private Sub Command1_Click()
    blnChoose = True
    intRetVal = SetCapture(hwnd)
End Sub

Private Sub Form_Load()
    
    blnChoose = False
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim window As Long
    Dim buffer As String * 1024
    Dim ptPoint As POINTAPI
   
    If blnChoose Then
    
        ptPoint.x = x
        ptPoint.y = y
        retval = ClientToScreen(hwnd, ptPoint)

        window = WindowFromPoint(ptPoint.x, ptPoint.y)
        lngRetVal = GetWindowText(window, buffer, 1024)
        Text1.Text = buffer
    End If
End Sub

