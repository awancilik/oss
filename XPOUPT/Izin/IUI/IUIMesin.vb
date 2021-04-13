Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIMesin
		Inherits XPLiteObject
		Dim fIUIMesinID As Guid
		<Key(true)> _
		Public Property IUIMesinID() As Guid
			Get
				Return fIUIMesinID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIMesinID", fIUIMesinID, value)
			End Set
		End Property
        Dim fIUIID As IUI
        Public Property IUIID() As IUI
            Get
                Return fIUIID
            End Get
            Set(ByVal value As IUI)
                SetPropertyValue(Of IUI)("IUIID", fIUIID, value)
            End Set
        End Property
		Dim fNama As String
		<Size(50)> _
		Public Property Nama() As String
			Get
				Return fNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Nama", fNama, value)
			End Set
		End Property
		Dim fKapasitas As String
		<Size(50)> _
		Public Property Kapasitas() As String
			Get
				Return fKapasitas
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kapasitas", fKapasitas, value)
			End Set
		End Property
		Dim fJumlah As Integer
		Public Property Jumlah() As Integer
			Get
				Return fJumlah
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("Jumlah", fJumlah, value)
			End Set
		End Property
		Dim fKeterangan As String
		Public Property Keterangan() As String
			Get
				Return fKeterangan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
			End Set
		End Property
		Dim fJenisPeralatan As String
		<Size(20)> _
		Public Property JenisPeralatan() As String
			Get
				Return fJenisPeralatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisPeralatan", fJenisPeralatan, value)
			End Set
		End Property
		Public Sub New(ByVal session As Session)
			MyBase.New(session)
		End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
