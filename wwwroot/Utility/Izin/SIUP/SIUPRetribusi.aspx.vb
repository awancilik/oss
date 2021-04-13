Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors

Partial Class Utility_Izin_SIUP_SIUPRetribusi
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        SIUPXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - PD - SIUP"

    Protected Sub CarASpxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CarASpxButton.Click
        If NoPermohonanASPxTextBox.Text IsNot Nothing Then
            Dim objPermohonan As Permohonan = session1.FindObject(Of Permohonan)(New BinaryOperator("NomorPermohonan", NoPermohonanASPxTextBox.Text.Trim))
            If objPermohonan IsNot Nothing Then
                If CekPD(objPermohonan) Then
                    SIUPDetailView.Visible = True
                    SIUPDetailView.ChangeMode(DetailsViewMode.Edit)
                Else
                    TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
                End If
            End If
        End If
    End Sub

    Private Function CekPD(ByVal obj As Permohonan) As Boolean
        Dim objPD As PermohonanDetail = session1.FindObject(Of PermohonanDetail)(CriteriaOperator.Parse( _
                                         "JenisIzinID.JenisIzinNama LIKE 'SIUP%' And PermohonanID='" & obj.PermohonanID.ToString & _
                                         "'"))
        If objPD IsNot Nothing Then
            If CekSIUP(objPD) Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekSIUP(ByVal obj As PermohonanDetail) As Boolean
        Dim siupID As CriteriaOperator = CriteriaOperator.Parse("SIUPID='" & obj.PermohonanIzinID.ToString & "'")
        Dim objSIUP As SIUP = DirectCast(session1.FindObject(GetType(SIUP), siupID), SIUP)
        If objSIUP IsNot Nothing Then
            Session("SIUPID") = objSIUP.SIUPID
            Return True
        Else
            Session("SIUPID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " Detail View "

    Protected Sub SIUPDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles SIUPDetailView.DataBound
        If SIUPDetailView.CurrentMode = DetailsViewMode.Edit Then
            Dim dv As DetailsView = SIUPDetailView
            Dim id As CriteriaOperator = CriteriaOperator.Parse("SIUPID='" & Session("SIUPID").ToString & "'")
            Dim obj As SIUP = DirectCast(session1.FindObject(GetType(SIUP), id), SIUP)
            If obj IsNot Nothing Then
                Dim tbRetribusi As ASPxTextBox = DirectCast(dv.FindControl("RetribusiASPxTextBox"), ASPxTextBox)
                tbRetribusi.Text = CStr(Tarif(obj))
            End If
        End If
    End Sub

    Private Function Tarif(ByVal obj As SIUP) As Decimal
        If obj.Kategori IsNot "" Then
            Dim kategori As String = obj.Kategori
            If kategori = "Kecil" Then
                Tarif = 50000
            ElseIf kategori = "Sedang" Then
                Tarif = 150000
            Else
                Tarif = 500000
            End If
        End If
    End Function

    Protected Sub SIUPDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles SIUPDetailView.ItemUpdated
        SIUPDetailView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub SIUPDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles SIUPDetailView.ItemUpdating
        Dim dv As DetailsView = SIUPDetailView
        Dim tbRetribusi As ASPxTextBox = DirectCast(dv.FindControl("RetribusiASPxTextBox"), ASPxTextBox)
        Dim obj As SIUP = DirectCast(session1.FindObject(GetType(SIUP), CriteriaOperator.Parse("SIUPID='" & Session("SIUPID").ToString & "'")), SIUP)
        If obj IsNot Nothing Then
            Dim Baca As New Baca
            obj.Retribusi = CDec(tbRetribusi.Text)
            obj.RetribusiTerbilang = Baca.Terbilang(CInt(obj.Retribusi).ToString)
            obj.Save()
        End If
    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("SIUPID") = Nothing
        End If
    End Sub



End Class
