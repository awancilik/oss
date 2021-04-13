Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOJenisLokasi
		Inherits XPLiteObject
		Dim fHOJenisLokasiID As Guid
        <Key(True)> _
        Public Property HOJenisLokasiID() As Guid
            Get
                Return fHOJenisLokasiID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HOJenisLokasiID", fHOJenisLokasiID, value)
            End Set
        End Property
        Dim fHOIndeksJenisID As HOJenisLokasi
        <Association("HOLokasiIndeks-HOJenisLokasi")> _
        Public Property HOIndeksJenisID() As HOJenisLokasi
            Get
                Return fHOIndeksJenisID
            End Get
            Set(ByVal value As HOJenisLokasi)
                SetPropertyValue(Of HOJenisLokasi)("HOIndeksJenisID", fHOIndeksJenisID, value)
            End Set
        End Property
		Dim fJenisLokasi As String
		<Size(200)> _
		Public Property JenisLokasi() As String
			Get
				Return fJenisLokasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisLokasi", fJenisLokasi, value)
			End Set
		End Property
		Dim fIndeks As Double
		Public Property Indeks() As Double
			Get
				Return fIndeks
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("Indeks", fIndeks, value)
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
