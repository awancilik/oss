Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDIDetail
		Inherits XPLiteObject
		Dim fTDIDetailID As Guid
		<Key(true)> _
		Public Property TDIDetailID() As Guid
			Get
				Return fTDIDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDIDetailID", fTDIDetailID, value)
			End Set
		End Property
        Dim fTDIID As TDI
        <Association("TDI-TDIDetail")> _
        Public Property TDIID() As TDI
            Get
                Return fTDIID
            End Get
            Set(ByVal value As TDI)
                SetPropertyValue(Of TDI)("TDIID", fTDIID, value)
            End Set
        End Property
        Dim fKLUIID As JenisUsahaKLUI
        Public Property KLUIID() As JenisUsahaKLUI
            Get
                Return fKLUIID
            End Get
            Set(ByVal value As JenisUsahaKLUI)
                SetPropertyValue(Of JenisUsahaKLUI)("KLUIID", fKLUIID, value)
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
