VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5445
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   5445
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command5 
      Caption         =   "Show code component form"
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Top             =   2880
      Width           =   2295
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   360
      Width           =   5055
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Test the Addem method"
      Height          =   495
      Left            =   2880
      TabIndex        =   3
      Top             =   2040
      Width           =   2535
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Test the ReturnSafeValue method"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   2040
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Test the SafeValue property"
      Height          =   495
      Left            =   2880
      TabIndex        =   1
      Top             =   1200
      Width           =   2535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test the NewValue property"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   1200
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim objExample As ExampleClass

Private Sub Command1_Click()
    Text1.Text = "The NewValue property = " & objExample.NewValue
End Sub

Private Sub Command2_Click()
    objExample.SafeValue = 5
    Text1.Text = "The SafeValue property was set to 5 and returns: " & objExample.SafeValue
End Sub

Private Sub Command3_Click()
    Text1.Text = "The ReturnSafeValue method returns: " & objExample.ReturnSafeValue
End Sub

Private Sub Command4_Click()
    Text1.Text = "Adding 2 + 2 with Addem yields: " & objExample.Addem(2, 2)
End Sub

Private Sub Command5_Click()
    objExample.ShowForm
End Sub

Private Sub Form_Load()
    Set objExample = CreateObject("NewClass.ExampleClass")
    objExample.SafeValue = 3
End Sub
