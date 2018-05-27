VERSION 5.00
Begin VB.UserControl CalculatorControl 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4500
   PropertyPages   =   "activexcalculatorcontrol.ctx":0000
   ScaleHeight     =   3600
   ScaleWidth      =   4500
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   1680
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "="
      Height          =   495
      Left            =   1680
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   300
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "+"
      Height          =   255
      Left            =   2160
      TabIndex        =   2
      Top             =   840
      Width           =   375
   End
End
Attribute VB_Name = "CalculatorControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "PropPageWizardRun" ,"Yes"

Public Event CalculatorClick()
Private Sub Command1_Click()
    Text3.Text = Str(Val(Text1.Text) + Val(Text2.Text))
End Sub

Public Property Get Operand1() As Variant
Attribute Operand1.VB_ProcData.VB_Invoke_Property = "PropertyPage1"
    Operand1 = Text1.Text
End Property

Public Property Let Operand1(ByVal vNewValue As Variant)
    Text1.Text = vNewValue
    PropertyChanged "Operand1"
End Property

Public Property Get Operand2() As Variant
Attribute Operand2.VB_ProcData.VB_Invoke_Property = "PropertyPage2"
    Operand2 = Text2.Text
End Property

Public Property Let Operand2(ByVal vNewValue As Variant)
    Text2.Text = vNewValue
    PropertyChanged "Operand2"
End Property

Private Sub UserControl_Click()
    RaiseEvent CalculatorClick
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Text1.Text = PropBag.ReadProperty("Operand1")
    Text2.Text = PropBag.ReadProperty("Operand2")
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Operand1", Text1.Text
    PropBag.WriteProperty "Operand2", Text2.Text
End Sub

Public Sub Calculate()
    Text3.Text = Str(Val(Text1.Text) + Val(Text2.Text))
End Sub
