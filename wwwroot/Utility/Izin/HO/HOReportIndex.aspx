<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="HOReportIndex.aspx.vb" Inherits="Utility_Izin_HO_HOReportIndex" title="HO Report Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<h1>
        HO Report Index
 </h1>
    <div class="main_menu">
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/HO/Keputusan.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan HO</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/HO/PetikanHO.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Petikan HO</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
             <%--<div class="left clearfix">
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/report/parameterPage/HO/HOSKRD.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak SKRD HO</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat SKRD Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>--%>
            
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/HO/IzinGangguanHO.aspx">
                <div class="inner_left image">
                    <img alt="Cetak IzinGangguan/HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Surat Izin Gangguan/HO</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Surat Ke Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            
             <div class="left clearfix">
                <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/report/parameterPage/HO/SKDUHO.aspx">
                <div class="inner_left image">
                    <img alt="Cetak SKDU HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Surat Keterangan Daftar Ulang HO</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Surat Ke Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            
        </div>
       </div>
        <div class="clearfix container">
            <%--<div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/IPT/JmlIPT.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Penerbitan IPT</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan penerbitan Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>--%>
            <%--<div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/IPT/SKRDIPT.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Retribusi IPT</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan Retribusi Izin Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>--%>
        </div>
</asp:Content>

