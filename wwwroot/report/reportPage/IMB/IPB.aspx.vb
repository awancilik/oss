Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class report_reportPage_IMB_IPB
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub CariNoIzin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariNoIzin.Click
        Dim noizin As String = NoIzinTextBox.Text
        If noizin <> "" Then
            Dim query As CriteriaOperator = CriteriaOperator.Parse("NoIjinIPB = '" & noizin & "'")
            Dim objIMB As IMB = DirectCast(session1.FindObject(GetType(IMB), query), IMB)
            Dim fNoIzin As String = objIMB.NoIjin.ToString
        End If
    End Sub
End Class
