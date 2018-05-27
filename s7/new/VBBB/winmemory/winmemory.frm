VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Read text from memory"
      Height          =   495
      Left            =   1320
      TabIndex        =   3
      Top             =   1800
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   1320
      TabIndex        =   2
      Top             =   2520
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1320
      TabIndex        =   1
      Text            =   "The text"
      Top             =   360
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Store text in memory"
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   1080
      Width           =   2175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const DataLength = 40
    
Dim outbuffer As String * DataLength
Dim inbuffer As String * DataLength

Dim hMemory As Long
Dim hMemoryPointer As Long

Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Sub MoveMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal dest As Any, ByVal src As Any, ByVal length As Long)
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Const GMEM_MOVEABLE = &H2

Private Sub Command1_Click()
    
    outbuffer = Text1.Text
    
    hMemory = GlobalAlloc(GMEM_MOVEABLE, DataLength)
    hMemoryPointer = GlobalLock(hMemory)
    
    Call MoveMemory(hMemoryPointer, outbuffer, DataLength)

End Sub

Private Sub Command2_Click()

    Call MoveMemory(inbuffer, hMemoryPointer, DataLength)
    
    Text2.Text = inbuffer
    
    GlobalUnlock (hMemoryPointer)
    GlobalFree (hMemory)

End Sub
