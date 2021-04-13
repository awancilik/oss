Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IMBBAP
    Inherits System.Web.UI.Page

    Dim session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        imbBAPXpoDataSource.Session = session1
        permohonanXpoDataSource.Session = session1
        imbPemeriksaanXpoDataSource.Session = session1
        imbPemeriksaanDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            CheckIMB(objPermohonan)
            CheckPemeriksaan()
            If CheckBAP() Then
                buatBAPASPxButton.Visible = False
            Else
                buatBAPASPxButton.Visible = True
            End If
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckIMB(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("permohonanID.PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objIMB As IMB = DirectCast(session1.FindObject(GetType(IMB), criteria), IMB)
        If objIMB IsNot Nothing Then
            Session("IMBID") = objIMB.IMBID
        Else
            Session("IMBID") = Nothing
        End If
    End Sub

    Private Function CheckPemeriksaan() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objPemeriksaan As IMBPemeriksaan = DirectCast(session1.FindObject(GetType(IMBPemeriksaan), criteria), IMBPemeriksaan)
        If objPemeriksaan IsNot Nothing Then
            Session("IMBPemeriksaanID") = objPemeriksaan.IMBPemeriksaanID
            Return True
        Else
            Session("IMBPemeriksaanID") = Nothing
            notFoundASPxPopupControl.ShowOnPageLoad = True
            Return False
        End If
    End Function

    Private Function CheckBAP() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objBAP As IMBBAP = DirectCast(session1.FindObject(GetType(IMBBAP), criteria), IMBBAP)
        If objBAP IsNot Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub buatBAPASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buatBAPASPxButton.Click
        imbBAPDetailsView.ChangeMode(DetailsViewMode.Insert)
        buatBAPASPxButton.Visible = False
    End Sub

    Protected Sub imbBAPDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles imbBAPDetailsView.ItemInserted
        If CheckBAP() Then
            buatBAPASPxButton.Visible = False
        Else
            buatBAPASPxButton.Visible = True
        End If
    End Sub

    Protected Sub imbBAPDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles imbBAPDetailsView.ItemInserting
        e.Values.Item("PermohonanID") = Session("PermohonanID")
        e.Values.Item("IMBID") = Session("IMBID")
        e.Values.Item("IMBPemeriksaanID") = Session("IMBPemeriksaanID")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IMBID") = Nothing
            Session("IMBPemeriksaanID") = Nothing
        End If
    End Sub

End Class
