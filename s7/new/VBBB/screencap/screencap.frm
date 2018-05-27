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
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      Height          =   3735
      Left            =   480
      ScaleHeight     =   3675
      ScaleWidth      =   5595
      TabIndex        =   0
      Top             =   120
      Width           =   5655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim blnStartCapture As Boolean
Dim blnAmCapturing As Boolean
Dim intHandleDisplay As Integer
Dim intStartX As Integer
Dim intStartY As Integer
Dim intMouseX As Integer
Dim intMouseY As Integer
Dim intOldMouseX As Integer
Dim intOldMouseY As Integer

Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, lpInitData As DEVMODE) As Long
Private Declare Function SetROP2 Lib "gdi32" (ByVal hdc As Long, ByVal nDrawMode As Long) As Long
Private Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As POINTAPI) As Long
Private Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long

Const SRCCOPY = &HCC0020
Const R2_NOT = 6

Private Sub Form_Load()
    Dim devDevMode As DEVMODE
    
    blnStartCapture = False
    blnAmCapturing = False
    
    intHandleDisplay = CreateDC("DISPLAY", 0&, 0&, devDevMode)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim ptPoint As POINTAPI
    
    If Button = 1 Then
        blnStartCapture = True
        intRetVal = SetCapture(hwnd)
    End If
    
    If blnStartCapture And Button = 2 Then
    
        ptPoint.x = x
        ptPoint.y = y
        retval = ClientToScreen(hwnd, ptPoint)
        intStartX = ptPoint.x
        intStartY = ptPoint.y

        intOldMouseX = intStartX
        intOldMouseY = intStartY
        
        blnAmCapturing = True
    End If
End Sub

Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    
    If blnAmCapturing Then
        
        EraseOld x, y
        
        intOldMouseX = intMouseX
        intOldMouseY = intMouseY
        
        DrawNew x, y
    
    End If
End Sub

Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim intLeftX As Integer
    Dim intLeftY As Integer

    If blnAmCapturing Then
        ReleaseCapture
        blnStartCapture = False
        blnAmCapturing = False
        
        EraseOld x, y
        
        intLeftX = intMouseX
        If intStartX < intMouseX Then
            intLeftX = intStartX
        End If
        
        intLeftY = intMouseY
        If intStartY < intMouseY Then
            intLeftY = intStartY
        End If

        Picture1.Cls
        intRetVal = BitBlt(Picture1.hdc, 0, 0, Abs(intStartX - intMouseX), Abs(intStartY - intMouseY), intHandleDisplay, intLeftX, intLeftY, SRCCOPY)
        
    End If
End Sub

Private Sub EraseOld(ByVal x As Integer, ByVal y As Integer)
    Dim ptPoint As POINTAPI
    
    intRetVal = SetROP2(intHandleDisplay, R2_NOT)
    
    ptPoint.x = x
    ptPoint.y = y
    retval = ClientToScreen(hwnd, ptPoint)
    intMouseX = ptPoint.x
    intMouseY = ptPoint.y
    
    lngRetVal = MoveToEx(intHandleDisplay, intOldMouseX, intOldMouseY, ptPoint)
    intRetVal = LineTo(intHandleDisplay, intStartX, intOldMouseY)
    intRetVal = LineTo(intHandleDisplay, intStartX, intStartY)
    intRetVal = LineTo(intHandleDisplay, intOldMouseX, intStartY)
    intRetVal = LineTo(intHandleDisplay, intOldMouseX, intOldMouseY)
  
End Sub

Private Sub DrawNew(ByVal x As Integer, ByVal y As Integer)
    Dim ptPoint As POINTAPI
    
    intRetVal = SetROP2(intHandleDisplay, R2_NOT)
    
    ptPoint.x = x
    ptPoint.y = y
    retval = ClientToScreen(hwnd, ptPoint)
    intMouseX = ptPoint.x
    intMouseY = ptPoint.y

    lngRetVal = MoveToEx(intHandleDisplay, intMouseX, intMouseY, ptPoint)
    intRetVal = LineTo(intHandleDisplay, intStartX, intMouseY)
    intRetVal = LineTo(intHandleDisplay, intStartX, intStartY)
    intRetVal = LineTo(intHandleDisplay, intMouseX, intStartY)
    intRetVal = LineTo(intHandleDisplay, intMouseX, intMouseY)

End Sub

Private Sub Form_Unload(Cancel As Integer)
    intRetVal = DeleteDC(intHandleDisplay)
End Sub

