VERSION 5.00
Object = "{FAEEE763-117E-101B-8933-08002B2F4F5A}#1.1#0"; "DBLIST32.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3120
   ClientLeft      =   1350
   ClientTop       =   1530
   ClientWidth     =   6390
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3120
   ScaleWidth      =   6390
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Bindings        =   "dbcontrols.frx":0000
      Height          =   1695
      Left            =   3360
      TabIndex        =   12
      Top             =   1200
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   2990
      _Version        =   393216
   End
   Begin VB.ComboBox Combo1 
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   315
      Left            =   1680
      TabIndex        =   1
      Text            =   "Combo1"
      Top             =   360
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   360
      Width           =   1215
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\vbbb\dbcontrols\db.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   1680
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "students"
      Top             =   2160
      Width           =   1215
   End
   Begin MSDBCtls.DBCombo DBCombo1 
      Bindings        =   "dbcontrols.frx":0014
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   315
      Left            =   1680
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   0
      ListField       =   "Name"
      BoundColumn     =   "Name"
      Text            =   "DBCombo1"
   End
   Begin MSDBCtls.DBList DBList1 
      Bindings        =   "dbcontrols.frx":0028
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   1620
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   2858
      _Version        =   393216
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      ListField       =   "Name"
      BoundColumn     =   "Name"
   End
   Begin VB.Label Label8 
      Caption         =   "Data Control"
      Height          =   255
      Left            =   1680
      TabIndex        =   11
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label7 
      Caption         =   "Flex Grid"
      Height          =   255
      Left            =   3360
      TabIndex        =   10
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label6 
      Caption         =   "DBCombo Box"
      Height          =   255
      Left            =   1680
      TabIndex        =   9
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label5 
      Caption         =   "DBList Box"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "Label"
      Height          =   255
      Left            =   3360
      TabIndex        =   7
      Top             =   120
      Width           =   615
   End
   Begin VB.Label Label3 
      Caption         =   "Combo Box"
      Height          =   255
      Left            =   1680
      TabIndex        =   6
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Text Box"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   495
      Left            =   3360
      TabIndex        =   2
      Top             =   360
      Width           =   2775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


