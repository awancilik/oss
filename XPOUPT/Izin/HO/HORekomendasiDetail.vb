Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HORekomendasiDetail
		Inherits XPLiteObject
		Dim fHORekomendasiDetailID As Guid
		<Key(true)> _
		Public Property HORekomendasiDetailID() As Guid
			Get
				Return fHORekomendasiDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HORekomendasiDetailID", fHORekomendasiDetailID, value)
			End Set
		End Property
        Dim fHORekomenID As HORekomendasi
        <Association("HORekomendasi-HORekomendasiDetail")> _
        Public Property HORekomenID() As HORekomendasi
            Get
                Return fHORekomenID
            End Get
            Set(ByVal value As HORekomendasi)
                SetPropertyValue(Of HORekomendasi)("HORekomenID", fHORekomenID, value)
            End Set
        End Property
		Dim fSaran As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property Saran() As String
			Get
				Return fSaran
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Saran", fSaran, value)
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
