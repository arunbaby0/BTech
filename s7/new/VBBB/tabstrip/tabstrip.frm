VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3150
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3150
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox PictureControl 
      Height          =   495
      Index           =   2
      Left            =   2040
      Picture         =   "tabstrip.frx":0000
      ScaleHeight     =   435
      ScaleWidth      =   1155
      TabIndex        =   4
      Top             =   2640
      Width           =   1215
   End
   Begin VB.PictureBox PictureControl 
      Height          =   495
      Index           =   1
      Left            =   1200
      Picture         =   "tabstrip.frx":1F442
      ScaleHeight     =   435
      ScaleWidth      =   1155
      TabIndex        =   3
      Top             =   2640
      Width           =   1215
   End
   Begin VB.PictureBox PictureControl 
      Height          =   495
      Index           =   0
      Left            =   360
      Picture         =   "tabstrip.frx":3E884
      ScaleHeight     =   435
      ScaleWidth      =   1155
      TabIndex        =   2
      Top             =   2640
      Width           =   1215
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   3360
      Top             =   2640
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   30
      ImageHeight     =   35
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   3
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "tabstrip.frx":5DCC6
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "tabstrip.frx":5E9AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "tabstrip.frx":5F692
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   480
      TabIndex        =   1
      Top             =   2520
      Width           =   3735
   End
   Begin ComctlLib.TabStrip TabStrip1 
      Height          =   2175
      Left            =   480
      TabIndex        =   0
      Top             =   240
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   3836
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Tabs {0713E432-850A-101B-AFC0-4210102A8DA7} 
         NumTabs         =   1
         BeginProperty Tab1 {0713F341-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   ""
            Key             =   ""
            Object.Tag             =   ""
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim Tab2, Tab3 As ComctlLib.Tab
Dim intLoopIndex As Integer

Set Tab1 = TabStrip1.Tabs(1)
Tab1.Key = "Key1"
Tab1.Caption = "Tab 1"
Tab1.Image = 1

Set Tab2 = TabStrip1.Tabs.Add()
Tab2.Key = "Key2"
Tab2.Caption = "Tab 2"
Tab2.Image = 2

Set Tab3 = TabStrip1.Tabs.Add()
Tab3.Key = "key3"
Tab3.Caption = "Tab 3"
Tab3.Image = 3

For intLoopIndex = 0 To PictureControl.Count - 1
    With PictureControl(intLoopIndex)
        .Move TabStrip1.ClientLeft, TabStrip1.ClientTop, TabStrip1.ClientWidth, TabStrip1.ClientHeight
    End With
Next intLoopIndex

PictureControl(0).ZOrder 0
End Sub

Private Sub TabStrip1_Click()
    PictureControl(TabStrip1.SelectedItem.Index - 1).ZOrder 0
    Text1.Text = "You clicked tab " & Str$(TabStrip1.SelectedItem.Index)
End Sub
