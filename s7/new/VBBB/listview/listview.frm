VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3345
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3345
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   480
      TabIndex        =   2
      Top             =   2760
      Width           =   3495
   End
   Begin ComctlLib.ImageList ImageList2 
      Left            =   2400
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   13
      ImageHeight     =   13
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   1
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "listview.frx":0000
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   1440
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   1
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "listview.frx":00FA
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   2280
      TabIndex        =   1
      Top             =   240
      Visible         =   0   'False
      Width           =   1215
   End
   Begin ComctlLib.ListView ListView1 
      Height          =   2415
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   4260
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      PictureAlignment=   3
      TextBackground  =   -1  'True
      _Version        =   393216
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList2"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label1 
      Caption         =   "Select view type:"
      Height          =   375
      Left            =   840
      TabIndex        =   3
      Top             =   240
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Dim colHeader As ColumnHeader
    Dim intLoopIndex As Integer
    
    For intLoopIndex = 1 To 4
        Set colHeader = ListView1.ColumnHeaders.Add()
        colHeader.Text = "Field " & intLoopIndex
        colHeader.Width = ListView1.Width / 4
    Next intLoopIndex

    Dim ListItem1 As ListItem
    Set ListItem1 = ListView1.ListItems.Add()
    ListItem1.Text = "Item 1"
    ListItem1.Icon = 1
    ListItem1.SmallIcon = 1
    ListView1.ListItems(1).ListSubItems.Add , , "Field 2"
    ListView1.ListItems(1).ListSubItems.Add , , "Field 3"
    ListView1.ListItems(1).ListSubItems.Add , , "Field 4"

    Dim ListItem2 As ListItem
    Set ListItem2 = ListView1.ListItems.Add()
    ListItem2.Text = "Item 2"
    ListItem2.Icon = 1
    ListItem2.SmallIcon = 1
    ListView1.ListItems(2).ListSubItems.Add , , "Field 2"
    ListView1.ListItems(2).ListSubItems.Add , , "Field 3"
    ListView1.ListItems(2).ListSubItems.Add , , "Field 4"

    Dim ListItem3 As ListItem
    Set ListItem3 = ListView1.ListItems.Add()
    ListItem3.Text = "Item 3"
    ListItem3.Icon = 1
    ListItem3.SmallIcon = 1
    ListView1.ListItems(3).ListSubItems.Add , , "Field 2"
    ListView1.ListItems(3).ListSubItems.Add , , "Field 3"
    ListView1.ListItems(3).ListSubItems.Add , , "Field 4"

    With Combo1
        .AddItem "Icon View"
        .AddItem "Small Icon View"
        .AddItem "List View"
        .AddItem "Report View"
    End With
    
End Sub

Private Sub ListView1_ColumnClick(ByVal ColumnHeader As ComctlLib.ColumnHeader)
    Text1.Text = "You clicked column " & ColumnHeader.Index

End Sub

Private Sub ListView1_ItemClick(ByVal Item As ComctlLib.ListItem)
    Text1.Text = "You clicked item " & Item.Index
End Sub
Private Sub Combo1_Change()
    ListView1.View = Combo1.ListIndex
End Sub

Private Sub Combo1_Click()
    ListView1.View = Combo1.ListIndex
End Sub


