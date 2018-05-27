VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3225
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3225
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   2640
      Width           =   3975
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   2040
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   13
      ImageHeight     =   13
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   3
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "treeview.frx":0000
            Key             =   "closed"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "treeview.frx":00FA
            Key             =   "leaf"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "treeview.frx":01F4
            Key             =   "open"
         EndProperty
      EndProperty
   End
   Begin ComctlLib.TreeView TreeView1 
      Height          =   2295
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   4048
      _Version        =   393216
      Indentation     =   530
      LineStyle       =   1
      Style           =   7
      ImageList       =   "ImageList1"
      Appearance      =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Dim Node1, Node2, Node3, Node4 As Node
    
    Set Node1 = TreeView1.Nodes.Add
    TreeView1.Nodes(1).Text = "Node 1"
    TreeView1.Nodes(1).Key = "Node 1"
    TreeView1.Nodes(1).Image = "closed"
    
    Set Node2 = TreeView1.Nodes.Add("Node 1", tvwChild, "Node 2")
    TreeView1.Nodes(2).Text = "Node 2"
    TreeView1.Nodes(2).Key = "Node 2"
    TreeView1.Nodes(2).Image = "leaf"
    
    Set Node3 = TreeView1.Nodes.Add("Node 1", tvwChild, "Node 3")
    TreeView1.Nodes(3).Text = "Node 3"
    TreeView1.Nodes(3).Key = "Node 3"
    TreeView1.Nodes(3).Image = "closed"

    Set Node4 = TreeView1.Nodes.Add("Node 3", tvwChild, "Node 4")
    TreeView1.Nodes(4).Text = "Node 4"
    TreeView1.Nodes(4).Key = "Node 4"
    TreeView1.Nodes(4).Image = "leaf"

End Sub

Private Sub TreeView1_Collapse(ByVal Node As ComctlLib.Node)
    Node.Image = "closed"

End Sub

Private Sub TreeView1_Expand(ByVal Node As ComctlLib.Node)
    Node.Image = "open"
End Sub

Private Sub TreeView1_NodeClick(ByVal Node As ComctlLib.Node)
    Text1.Text = "You clicked " & Node.Text
End Sub
