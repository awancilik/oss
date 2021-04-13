Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPTPemeriksaan
		Inherits XPLiteObject
		Dim fIPTPemeriksaanID As Guid
		<Key(true)> _
		Public Property IPTPemeriksaanID() As Guid
			Get
				Return fIPTPemeriksaanID
			End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("IPTPemeriksaanID", fIPTPemeriksaanID, value)
            End Set
		End Property
		Dim fIPTPemeriksaanNomor As String
		<Size(50)> _
		Public Property IPTPemeriksaanNomor() As String
			Get
				Return fIPTPemeriksaanNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IPTPemeriksaanNomor", fIPTPemeriksaanNomor, value)
			End Set
		End Property
        Dim fIPTPemeriksaanTanggal As DateTime
        Public Property IPTPemeriksaanTanggal() As DateTime
            Get
                Return fIPTPemeriksaanTanggal
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("IPTPemeriksaanTanggal", fIPTPemeriksaanTanggal, value)
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
		Dim fIPTID As Guid
		Public Property IPTID() As Guid
			Get
				Return fIPTID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPTID", fIPTID, value)
			End Set
        End Property
        <Association("IPTPemeriksaan-IPTPemeriksaanDetail")> _
        Public ReadOnly Property IPTPemeriksaanDetail() As XPCollection(Of IPTPemeriksaanDetail)
            Get
                Return GetCollection(Of IPTPemeriksaanDetail)("IPTPemeriksaanDetail")
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
