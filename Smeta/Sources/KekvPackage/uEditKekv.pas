unit uEditKekv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, USprKekv,pFibStoredProc,ComCtrls,
  Resources_unitb, cxControls, cxContainer, cxEdit, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxCalendar , GlobalSpr;

type
  TfrmEditKekv = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    EdKekvCode: TEdit;
    Button1: TButton;
    Button2: TButton;
    EdKekvTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxCheckBox1: TcxCheckBox;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    OLD_KEKV_CH_DATE: TcxDateEdit;
    Label5: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    old_id_kekv :Variant;
    EditFlag:Boolean;
    ViewFlag:Boolean;
    procedure InsertData;
    procedure UpdateData;
    function CheckInputData:Boolean;
    { Public declarations }
  end;

implementation

uses FIBQuery, DB;

{$R *.dfm}

procedure TfrmEditKekv.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize:=false;
end;

procedure TfrmEditKekv.FormShow(Sender: TObject);
begin
    if EditFlag
    then begin
              EdKekvCode.Text:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('KEKV_CODE').AsString;
              EdKekvTitle.Text:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('KEKV_TITLE').asString;
              cxCheckBox1.Checked:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('ENABLED').AsBoolean;
              Edit1.Text:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('KEKV_KODE_PRINT').AsString;
              cxButtonEdit1.Text:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('OLD_ID_KEKV_TEXT').AsString;
              old_id_kekv:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('OLD_ID_KEKV').value;
              OLD_KEKV_CH_DATE.Date:=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('OLD_KEKV_CH_DATE').value;

    end ;
    if ViewFlag
    then begin
              Button1.Visible:=false;
    end;

end;

procedure TfrmEditKekv.Button1Click(Sender: TObject);
begin
if CheckInputData
then begin
     if EditFlag
     then UpdateData
     else InsertData;
     ModalResult:=mrYes;
end;
end;

procedure TfrmEditKekv.InsertData;
var Proc:TpFibStoredProc;
    IdKekv:Int64;
begin
      Proc:=TpFibStoredProc.Create(self);
      Proc.Database:=TfrmKekvSprBPL(self.Owner).WorkDatabase;
      Proc.Transaction:=TfrmKekvSprBPL(self.Owner).WriteTransaction;
      proc.StoredProcName:='PUB_KEKV_INSERT';
      TfrmKekvSprBPL(self.Owner).WriteTransaction.StartTransaction;
      try
            proc.Prepare;
            proc.ParamByName('P_KEKV_KODE').value :=StrToInt(Trim(EdKekvCode.Text));
            proc.ParamByName('P_KEKV_TITLE').value:=Trim(EdKekvTitle.Text);
            proc.ParamByName('P_USE_BEG').value   :=TfrmKekvSprBPL(self.Owner).ActualDate;
            proc.ParamByName('P_LINKTO').value    :=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('ID_KEKV').Value;
            proc.ParamByName('P_ENABLED').value   :=Integer(cxCheckBox1.Checked);
            proc.ParamByName('P_KEKV_CODE_PRINT').value   :=Edit1.Text;
            proc.ParamByName('P_OLD_ID_KEKV').Value        :=old_id_kekv;
            proc.ParamByName('P_OLD_KEKV_CH_DATE').value   :=OLD_KEKV_CH_DATE.Date;
            proc.ExecProc;
      except on Exception do
            begin
               TfrmKekvSprBPL(self.Owner).WriteTransaction.Rollback;
            end;
      end;
      idkekv:=proc.ParamByName('P_ID_KEKV').AsInt64;
      TfrmKekvSprBPL(self.Owner).WriteTransaction.Commit;
      TfrmKekvSprBPL(self.Owner).KekvDataSet.CloseOpen(true);
      TfrmKekvSprBPL(self.Owner).KekvDataSet.Locate('id_kekv',idkekv,[]);
      Proc.Free;
end;

procedure TfrmEditKekv.UpdateData;
  var Proc:TpFibStoredProc;
      idkekv:int64;
begin
      Proc:=TpFibStoredProc.Create(self);
      Proc.Database:=TfrmKekvSprBPL(self.Owner).WorkDatabase;
      Proc.Transaction:=TfrmKekvSprBPL(self.Owner).WriteTransaction;
      proc.StoredProcName:='PUB_KEKV_UPDATE';
      TfrmKekvSprBPL(self.Owner).WriteTransaction.StartTransaction;
      try
            proc.Prepare;
            idkekv                                :=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('ID_KEKV').value;
            proc.ParamByName('P_ID_KEKV').value   :=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('ID_KEKV').value;
            proc.ParamByName('P_KEKV_KODE').value :=StrToInt(Trim(EdKekvCode.Text));
            proc.ParamByName('P_KEKV_TITLE').value:=Trim(EdKekvTitle.Text);
            proc.ParamByName('P_USE_BEG').value   :=TfrmKekvSprBPL(self.Owner).ActualDate;
            proc.ParamByName('P_USE_END').value   :=TfrmKekvSprBPL(self.Owner).ActualDate-1;
            proc.ParamByName('P_LINKTO').value    :=TfrmKekvSprBPL(self.Owner).KekvDataSet.FieldByName('LINKTO').value;
            proc.ParamByName('P_ENABLED').Value   :=cxCheckBox1.Checked;
            proc.ParamByName('P_KEKV_KODE_PRINT').value   :=Edit1.Text;
            proc.ParamByName('P_OLD_ID_KEKV').Value        :=old_id_kekv;
            proc.ParamByName('P_OLD_KEKV_CH_DATE').value   :=OLD_KEKV_CH_DATE.Date;


            proc.ExecProc;
      except on Exception do
            begin
                             TfrmKekvSprBPL(self.Owner).WriteTransaction.Rollback;
            end;
      end;
      TfrmKekvSprBPL(self.Owner).WriteTransaction.Commit;
      TfrmKekvSprBPL(self.Owner).KekvDataSet.CloseOpen(true);
      TfrmKekvSprBPL(self.Owner).KekvDataSet.Locate('id_kekv',idkekv,[]);
      Proc.Free;
end;

procedure TfrmEditKekv.Button2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmEditKekv.CheckInputData: Boolean;
var ResChecking:Boolean;
begin
        ResChecking:=true;

        if (EdKekvCode.Text='') and ResChecking
        then begin
             EdKekvCode.SetFocus;
             ResChecking:=false;
             MessageBox(Application.Handle,PChar(BU_TitleError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
        end;

        if (EdKekvTitle.Text='') and ResChecking
        then begin
             EdKekvTitle.SetFocus;
             ResChecking:=false;
             MessageBox(Application.Handle,PChar(BU_TitleError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
        end;

        CheckInputData:=ResChecking;
end;

procedure TfrmEditKekv.FormCreate(Sender: TObject);
begin
    Caption:=BU_KEKV_INFO_WORK;
    label1.Caption:=BU_KEKV_CODE;
    label2.Caption:=BU_KEKV_TITLE_EDIT;
    Button1.Caption:=PUB_BUTTON_OK_CONST;
    Button2.Caption:=PUB_BUTTON_CANCEL_CONST;
    OLD_KEKV_CH_DATE.Date:=Date;
end;

procedure TfrmEditKekv.cxButtonEdit1Click(Sender: TObject);
var Res:Variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,TfrmKekvSprBPL(self.Owner).WorkDatabase.Handle,fsNormal,OLD_KEKV_CH_DATE.Date,1);
    if VarArrayDimCount(Res)>0
    then begin
              old_id_kekv:=Res[0][0];
              cxButtonEdit1.Text:=VarToStr(Res[0][2])+' "'+VarToStr(Res[0][1])+'"';
    end;
end;

end.
