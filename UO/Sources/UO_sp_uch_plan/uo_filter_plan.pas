unit uo_filter_plan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxCheckBox, StdCtrls,
  cxRadioGroup, ExtCtrls, cxLookAndFeelPainters, cxButtons, FIBDatabase,
  pFIBDatabase, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
  FIBDataSet, pFIBDataSet;

type
  Tfmuo_filter_plan = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    DB: TpFIBDatabase;
    ActionList1: TActionList;
    Action1: TAction;
    Tr: TpFIBTransaction;
    TWr: TpFIBTransaction;
    St: TpFIBStoredProc;
    DS: TpFIBDataSet;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxCheckBox3Click(Sender: TObject);
    procedure cxCheckBox4Click(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
  private
    { Private declarations }
    f : boolean;
  public
    id_u, id_ses : int64;
  end;

function Uo_show_filter (id_user, id_ses : int64; DB : TpfibDatabase) : boolean;

implementation
uses uo_filter_change;

{$R *.dfm}

function Uo_show_filter (id_user, id_ses : int64; DB : TpfibDatabase) : boolean;
var
    T : Tfmuo_filter_plan;
begin
    T        := Tfmuo_filter_plan.Create(nil);
    T.id_u   := id_user;
    T.f      := false;
    T.id_ses := id_ses;
    T.DB     := DB;
    T.Tr.DefaultDatabase    := T.DB;
    T.DB.DefaultTransaction := T.Tr;

    T.TWr.DefaultDatabase   := T.DB;
    T.DS.Database           := T.DB;
    T.DS.Transaction        := T.TWr;

    T.Tr.StartTransaction;


    T.TWr.StartTransaction;

    T.DS.Close;
    T.DS.SQLs.SelectSQL.Text := 'select * from UO_FILTER_SELECT('+intToStr(T.id_ses)+', '+IntToStr(T.id_u)+')';
    T.DS.Open;

    if T.DS.FBN('P1').AsInteger = 1 then
    begin
        T.cxCheckBox1.Checked    := true;
        t.cxRadioButton1.Checked := true;
        T.cxButton3.Enabled      := true;
    end;
    if T.DS.FBN('P2').AsInteger = 1 then
    begin
        T.cxCheckBox1.Checked    := true;
        t.cxRadioButton2.Checked := true;
        T.cxButton4.Enabled      := true;
    end;
    if T.DS.FBN('P3').AsInteger = 1 then
    begin
        T.cxCheckBox2.Checked := true;
        T.cxButton5.Enabled       := true;
    end;
    if T.DS.FBN('P4').AsInteger = 1 then
    begin
        T.cxCheckBox3.Checked := true;
        T.cxButton6.Enabled   := true;
    end;
    if T.DS.FBN('P5').AsInteger = 1 then
    begin
        T.cxCheckBox4.Checked := true;
        T.cxButton7.Enabled   := true;
    end;
    T.DS.Close;

    T.TWr.Commit;

    if T.ShowModal = mrOk then
    begin
        Result := true;
    end else
        Result := false;
    T.Free;
end;

procedure Tfmuo_filter_plan.cxButton3Click(Sender: TObject);
begin
    if Uo_show_filter_shange(id_u, id_ses, DB, 1) then
    begin

    end;
end;

procedure Tfmuo_filter_plan.cxButton4Click(Sender: TObject);
begin
    if Uo_show_filter_shange(id_u, id_ses, DB, 2) then
    begin

    end;

end;

procedure Tfmuo_filter_plan.cxButton5Click(Sender: TObject);
begin
    if Uo_show_filter_shange(id_u, id_ses, DB, 3) then
    begin

    end;

end;

procedure Tfmuo_filter_plan.cxButton6Click(Sender: TObject);
begin
    if Uo_show_filter_shange(id_u, id_ses, DB, 4) then
    begin

    end;

end;

procedure Tfmuo_filter_plan.cxButton7Click(Sender: TObject);
begin
    if Uo_show_filter_shange(id_u, id_ses, DB, 5) then
    begin

    end;

end;

procedure Tfmuo_filter_plan.cxButton2Click(Sender: TObject);
begin
    if not f then
    begin
        TWr.DefaultDatabase := DB;
        St.Database     := DB;
        St.Transaction  := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_FILTER_DELETE_F';//   UO_FILTER_ENTER';
            St.ParamByName('D_ID_USER').AsInt64         := id_u;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
    end;
    Close;
end;

procedure Tfmuo_filter_plan.Action1Execute(Sender: TObject);
begin
        TWr.DefaultDatabase := DB;
        St.Database     := DB;
        St.Transaction  := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_FILTER_ENTER';
            St.ParamByName('D_ID_USER').AsInt64         := id_u;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
    if not cxCheckBox2.Checked then
    begin
            TWr.DefaultDatabase := DB;
            St.Database     := DB;
            St.Transaction  := TWr;
            try
                TWr.StartTransaction;
                St.StoredProcName := 'UO_FILTER_YEAR_NABOR_DEL_ALL';
                St.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                St.ParamByName('D_ID_USER').AsInt64         := id_u;
                St.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
    end;
    if not cxCheckBox3.Checked then
    begin
            TWr.DefaultDatabase := DB;
            St.Database     := DB;
            St.Transaction  := TWr;
            try
                TWr.StartTransaction;
                St.StoredProcName := 'UO_FILTER_FORMA_DEL_ALL';
                St.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                St.ParamByName('D_ID_USER').AsInt64         := id_u;
                St.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
    end;
    if not cxCheckBox4.Checked then
    begin
            TWr.DefaultDatabase := DB;
            St.Database     := DB;
            St.Transaction  := TWr;
            try
                TWr.StartTransaction;
                St.StoredProcName := 'UO_FILTER_KAT_DEL_ALL';
                St.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                St.ParamByName('D_ID_USER').AsInt64         := id_u;
                St.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
    end;
    if ((not cxCheckBox1.Checked) or ((cxCheckBox1.Checked) and (cxRadioButton2.Checked))) then
    begin
            TWr.DefaultDatabase := DB;
            St.Database     := DB;
            St.Transaction  := TWr;
            try
                TWr.StartTransaction;
                St.StoredProcName := 'UO_FILTER_FAK_DEL_ALL';
                St.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                St.ParamByName('D_ID_USER').AsInt64         := id_u;
                St.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
    end;
    if ((not cxCheckBox1.Checked) or ((cxCheckBox1.Checked) and (cxRadioButton1.Checked))) then
    begin
            TWr.DefaultDatabase := DB;
            St.Database     := DB;
            St.Transaction  := TWr;
            try
                TWr.StartTransaction;
                St.StoredProcName := 'UO_FILTER_SPEC_DEL_ALL';
                St.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                St.ParamByName('D_ID_USER').AsInt64         := id_u;
                St.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
    end;


    f := true;
    ModalResult := mrOk;
end;

procedure Tfmuo_filter_plan.cxButton1Click(Sender: TObject);
begin
    Action1Execute(Sender);
end;

procedure Tfmuo_filter_plan.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxRadioButton1.Enabled  := true;
        cxRadioButton2.Enabled  := true;
        cxRadioButton1.Checked  := true;
        cxButton3.Enabled       := true;
//        cxButton4.Enabled       := true;
    end else
    begin
        cxRadioButton1.Enabled  := false;
        cxRadioButton2.Enabled  := false;
        cxButton3.Enabled       := false;
        cxButton4.Enabled       := false;
    end;
end;

procedure Tfmuo_filter_plan.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBox2.Checked then
    begin
        cxButton5.Enabled       := true;
    end else
    begin
        cxButton5.Enabled       := false;
    end;
end;

procedure Tfmuo_filter_plan.cxCheckBox3Click(Sender: TObject);
begin
    if cxCheckBox3.Checked then
    begin
        cxButton6.Enabled       := true;
    end else
    begin
        cxButton6.Enabled       := false;
    end;

end;

procedure Tfmuo_filter_plan.cxCheckBox4Click(Sender: TObject);
begin
    if cxCheckBox4.Checked then
    begin
        cxButton7.Enabled       := true;
    end else
    begin
        cxButton7.Enabled       := false;
    end;

end;

procedure Tfmuo_filter_plan.cxRadioButton1Click(Sender: TObject);
begin
    if cxRadioButton1.Checked then
    begin
        cxButton3.Enabled := true;
        cxButton4.Enabled := false;
    end else
    begin
        cxButton3.Enabled := false;
        cxButton4.Enabled := true;
    end;
end;

procedure Tfmuo_filter_plan.cxRadioButton2Click(Sender: TObject);
begin
    if cxRadioButton2.Checked then
    begin
        cxButton3.Enabled := false;
        cxButton4.Enabled := true;
    end else
    begin
        cxButton3.Enabled := true;
        cxButton4.Enabled := false;
    end;

end;

end.
