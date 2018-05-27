VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   5580
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   5580
   StartUpPosition =   3  'Windows Default
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   690
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5580
      _ExtentX        =   9843
      _ExtentY        =   1217
      ButtonWidth     =   2461
      ButtonHeight    =   1058
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   4
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   1
            Style           =   2
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   2
            Style           =   4
            Object.Width           =   1400
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   2
            Style           =   2
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   3
            Style           =   2
         EndProperty
      EndProperty
      Begin VB.ComboBox Combo1 
         Height          =   315
         ItemData        =   "combotoolbar.frx":0000
         Left            =   1440
         List            =   "combotoolbar.frx":0013
         TabIndex        =   1
         Top             =   120
         Width           =   1215
      End
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   2055
      Top             =   1305
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   86
      ImageHeight     =   34
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "combotoolbar.frx":0042
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "combotoolbar.frx":231E
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "combotoolbar.frx":45FA
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Begin VB.Menu Open 
         Caption         =   "Open"
      End
      Begin VB.Menu Save 
         Caption         =   "Save"
      End
      Begin VB.Menu Close 
         Caption         =   "Close"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Change()
    MsgBox "You entered " & Combo1.Text
End Sub

Private Sub Combo1_Click()
    MsgBox "You selected " & Combo1.Text
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As ComctlLib.Button)
    MsgBox "You clicked button " & Button.Index
End Sub

