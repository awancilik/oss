Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOPemeriksaan
		Inherits XPLiteObject
		Dim fHOPemeriksaanID As Guid
		<Key(true)> _
		Public Property HOPemeriksaanID() As Guid
			Get
				Return fHOPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOPemeriksaanID", fHOPemeriksaanID, value)
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

        Dim fHOID As Guid
        Public Property HOID() As Guid
            Get
                Return fHOID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HOID", fHOID, value)
            End Set
        End Property

		Dim fHOPemeriksaanNomor As String
		<Size(50)> _
		Public Property HOPemeriksaanNomor() As String
			Get
				Return fHOPemeriksaanNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("HOPemeriksaanNomor", fHOPemeriksaanNomor, value)
			End Set
        End Property

		Dim fHOPemeriksaanTanggal As DateTime
		Public Property HOPemeriksaanTanggal() As DateTime
			Get
				Return fHOPemeriksaanTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("HOPemeriksaanTanggal", fHOPemeriksaanTanggal, value)
			End Set
        End Property

        <Association("HOPemeriksaan-HOPemeriksaanDetail")> _
        Public ReadOnly Property HOPemeriksaanDetail() As XPCollection(Of HOPemeriksaanDetail)
            Get
                Return GetCollection(Of HOPemeriksaanDetail)("HOPemeriksaanDetail")
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
