Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBPemeriksaan
		Inherits XPLiteObject
		Dim fIMBPemeriksaanID As Guid
		<Key(true)> _
		Public Property IMBPemeriksaanID() As Guid
			Get
				Return fIMBPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBPemeriksaanID", fIMBPemeriksaanID, value)
			End Set
		End Property
		Dim fIMBPemeriksaanNomor As String
		<Size(50)> _
		Public Property IMBPemeriksaanNomor() As String
			Get
				Return fIMBPemeriksaanNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IMBPemeriksaanNomor", fIMBPemeriksaanNomor, value)
			End Set
		End Property
		Dim fIMBPemeriksaanTanggal As DateTime
		Public Property IMBPemeriksaanTanggal() As DateTime
			Get
				Return fIMBPemeriksaanTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("IMBPemeriksaanTanggal", fIMBPemeriksaanTanggal, value)
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
		Dim fIMBID As Guid
		Public Property IMBID() As Guid
			Get
				Return fIMBID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBID", fIMBID, value)
			End Set
        End Property

        <Association("IMBPemeriksaan-IMBPemeriksaanDetail")> _
        Public ReadOnly Property IMBPemeriksaanDetail() As XPCollection(Of IMBPemeriksaanDetail)
            Get
                Return GetCollection(Of IMBPemeriksaanDetail)("IMBPemeriksaanDetail")
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
