Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HORekomendasi
		Inherits XPLiteObject
        Dim fHORekomendasiID As Guid
        <Key(True)> _
        <Association("HORekomendasi-HORekomendasiDetail")> _
              Public Property HORekomendasiID() As Guid
            Get
                Return fHORekomendasiID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HORekomendasiID", fHORekomendasiID, value)
            End Set
        End Property
		Dim fRekomendasi As String
		<Size(200)> _
		Public Property Rekomendasi() As String
			Get
				Return fRekomendasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Rekomendasi", fRekomendasi, value)
			End Set
        End Property

        <Association("HORekomendasi-HORekomendasiDetail")> _
         Public ReadOnly Property HORekomendasiDetail() As XPCollection(Of HORekomendasiDetail)
            Get
                Return GetCollection(Of HORekomendasiDetail)("HORekomendasiDetail")
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
