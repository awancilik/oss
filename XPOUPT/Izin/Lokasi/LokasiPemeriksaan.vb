Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiPemeriksaan
		Inherits XPLiteObject
		Dim fLokasiPemeriksaanID As Guid
		<Key(true)> _
		Public Property LokasiPemeriksaanID() As Guid
			Get
				Return fLokasiPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiPemeriksaanID", fLokasiPemeriksaanID, value)
			End Set
		End Property
		Dim fLokasiPemeriksaanNomor As String
		<Size(50)> _
		Public Property LokasiPemeriksaanNomor() As String
			Get
				Return fLokasiPemeriksaanNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("LokasiPemeriksaanNomor", fLokasiPemeriksaanNomor, value)
			End Set
		End Property
		Dim fLokasiPemeriksaanTanggal As DateTime
		Public Property LokasiPemeriksaanTanggal() As DateTime
			Get
				Return fLokasiPemeriksaanTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("LokasiPemeriksaanTanggal", fLokasiPemeriksaanTanggal, value)
			End Set
		End Property
		Dim fPermohonanID As Guid
		Public Property PermohonanID() As Guid
			Get
				Return fPermohonanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PermohonanID", fPermohonanID, value)
			End Set
		End Property
		Dim fLokasiID As Guid
		Public Property LokasiID() As Guid
			Get
				Return fLokasiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiID", fLokasiID, value)
			End Set
        End Property

        <Association("LokasiPemeriksaan-LokasiPemeriksaanDetail")> _
        Public ReadOnly Property LokasiPemeriksaanDetail() As XPCollection(Of LokasiPemeriksaanDetail)
            Get
                Return GetCollection(Of LokasiPemeriksaanDetail)("LokasiPemeriksaanDetail")
            End Get
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
