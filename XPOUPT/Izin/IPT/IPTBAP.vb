Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPTBAP
        Inherits XPLiteObject

		Dim fIPTBAPID As Guid
		<Key(true)> _
		Public Property IPTBAPID() As Guid
			Get
				Return fIPTBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPTBAPID", fIPTBAPID, value)
			End Set
        End Property

		Dim fIPTBAPNomor As String
		<Size(50)> _
		Public Property IPTBAPNomor() As String
			Get
				Return fIPTBAPNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IPTBAPNomor", fIPTBAPNomor, value)
			End Set
        End Property

		Dim fIPTBAPTanggal As DateTime
		Public Property IPTBAPTanggal() As DateTime
			Get
				Return fIPTBAPTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("IPTBAPTanggal", fIPTBAPTanggal, value)
			End Set
        End Property

		Dim fIPTBAPCatatan As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property IPTBAPCatatan() As String
			Get
				Return fIPTBAPCatatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IPTBAPCatatan", fIPTBAPCatatan, value)
			End Set
        End Property

		Dim fIPTBAPRekomendasi As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property IPTBAPRekomendasi() As String
			Get
				Return fIPTBAPRekomendasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IPTBAPRekomendasi", fIPTBAPRekomendasi, value)
			End Set
        End Property

        Dim fPermohonanID As Permohonan
        Public Property PermohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("PermohonanID", fPermohonanID, value)
            End Set
        End Property

        Dim fIPTID As IPT
        Public Property IPTID() As IPT
            Get
                Return fIPTID
            End Get
            Set(ByVal value As IPT)
                SetPropertyValue(Of IPT)("IPTID", fIPTID, value)
            End Set
        End Property

        Dim fIPTPemeriksaanID As IPTPemeriksaan
        Public Property IPTPemeriksaanID() As IPTPemeriksaan
            Get
                Return fIPTPemeriksaanID
            End Get
            Set(ByVal value As IPTPemeriksaan)
                SetPropertyValue(Of IPTPemeriksaan)("IPTPemeriksaanID", fIPTPemeriksaanID, value)
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
