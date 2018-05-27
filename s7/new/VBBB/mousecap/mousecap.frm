VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2625
   ClientLeft      =   1425
   ClientTop       =   2175
   ClientWidth     =   4800
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   175
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   3120
      TabIndex        =   2
      Top             =   840
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   480
      TabIndex        =   1
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start mouse capture"
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   1800
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "Mouse y location:"
      Height          =   255
      Left            =   3120
      TabIndex        =   4
      Top             =   600
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Mouse x location:"
      Height          =   255
      Left            =   480
      TabIndex        =   3
      Top             =   600
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim blnStartCapture As Boolean
Dim blnAmCapturing As Boolean

Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long

Private Sub Command1_Click()
    blnStartCapture = True
    intRetVal = SetCapture(hwnd)
    Command1.Caption = "Drag the mouse"
End Sub

Private Sub Form_Load()
   
    blnStartCapture = False
    blnAmCapturing = False
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim ptPoint As POINTAPI

    If blnStartCapture Then
        ptPoint.x = x
        ptPoint.y = y
        retval = ClientToScreen(hwnd, ptPoint)
        Text1.Text = Str(ptPoint.x)
        Text2.Text = Str(ptPoint.y)
        
        blnAmCapturing = True
    End If
End Sub

Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim ptPoint As POINTAPI
    
    If blnAmCapturing Then
        
        ptPoint.x = x
        ptPoint.y = y
        retval = ClientToScreen(hwnd, ptPoint)
        Text1.Text = Str(ptPoint.x)
        Text2.Text = Str(ptPoint.y)
    
    End If
End Sub

Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

    If blnAmCapturing Then
    
        ReleaseCapture
        blnStartCapture = False
        blnAmCapturing = False
        Command1.Caption = "Start capture"
        
    End If
End Sub

