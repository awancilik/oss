<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IMBReportIndex.aspx.vb" Inherits="Utility_Izin_IMBReportIndex" Title="IMB Report Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>
        IMB Report Index</h1>
    <div class="main_menu">
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/IMB/ReportKeputusanIMB.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan IMB</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin IMB<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/IMB/ReportPetikanKeputusan.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Petikan IMB</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin IMB<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/IMB/IMBJmlIzin.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Penerbitan Izin IMB</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan penerbitan Izin IMB<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/IMB/IMBretribusiBulanan.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Retribusi IMB</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan Retribusi Izin IMB<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/report/parameterPage/IMB/hrPemeriksaan.aspx">
                    <div class="inner_left image">
                        <img alt="Cetak Pemeriksaan" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Cetak Undangan Pemeriksaan</span>
                        <span class="ket_text">
                            Berfungsi untuk mencetak undangan pemeriksaan<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/report/parameterPage/IMB/rpKeputusanIPB.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Surat Keputusan IPB</span>
                        <span class="ket_text">
                            Berfungsi untuk mencetak Surat KeputusanIPB<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/report/parameterPage/IMB/hrPetikanIPB.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Surat Petikan Keputusan IPB</span>
                        <span class="ket_text">
                            Berfungsi untuk mencetak Surat Petikan Keputusan IPB<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton7" runat="server" PostBackUrl="~/report/parameterPage/IMB/hrKeputusanSementara.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Surat Keputusan Sementara</span>
                        <span class="ket_text">
                            Berfungsi untuk mencetak Surat Keputusan Sementara<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>