unit uEditProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pFibStoredProc, DB, FIBDataSet, pFIBDataSet,
  DBCtrls,Resources_unitb;

type
  TfrmEditProp = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    ConfirmButton: TButton;
    CanselButton: TButton;
    Label1: TLabel;
    EdPropTitle: TEdit;
    cbPropType: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    EdPropNum: TEdit;
    Label4: TLabel;
    GroupValue: TDBLookupComboBox;
    PropGroupFIBDataSet: TpFIBDataSet;
    PropGroupFIBDataSource: TDataSource;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConfirmButtonClick(Sender: TObject);
    procedure CanselButtonClick(Sender: TObject);
    procedure EdPropNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    IsEdit:Boolean;
    IsView:Boolean;
    function CheckInputData:Boolean;
    procedure UpdateData;
    procedure InsertData;

    { Public declarations }
  end;


implementation
uses uMainSchOper, FIBQuery, BaseTypes;
{$R *.dfm}

procedure TfrmEditProp.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
       Resize:=false;
end;

procedure TfrmEditProp.FormCreate(Sender: TObject);
begin
       IsEdit:=false;
       IsView:=false;
end;

procedure TfrmEditProp.FormShow(Sender: TObject);
var NewNumQuery:TpFibDataSet;
begin
       PropGroupFIBDataSet.Database:=TfrmMainOper(self.Owner).WorkDatabase;
       PropGroupFIBDataSet.Transaction:=TfrmMainOper(self.Owner).ReadTransaction;
       PropGroupFIBDataSet.Open;
       PropGroupFIBDataSet.FetchAll;


       if  IsEdit
       then begin
           GroupValue.KeyValue:=TfrmMainOper(self.Owner).PropDataSet.FieldByName('ID_SP_PROP_GROUP').AsInteger;
           EdPropTitle.Text:=TfrmMainOper(self.Owner).PropDataSet.FieldByName('PROP_TITLE').AsString;
           EdPropNum.Text:=TfrmMainOper(self.Owner).PropDataSet.FieldByName('PROP_N_PP').AsString;
           EdPropNum.Enabled:=false;
           cbPropType.ItemIndex:=TfrmMainOper(self.Owner).PropDataSet.FieldByName('TYPE_OBJECT').AsInteger;
       end
       else begin
           NewNumQuery:=TpFibDataSet.Create(self);
           NewNumQuery.Database:=TfrmMainOper(self.Owner).WorkDatabase;
           NewNumQuery.Transaction:=TfrmMainOper(self.Owner).ReadTransaction;
           NewNumQuery.SQLs.SelectSQL.Text:=' SELECT MAX(PROP_N_PP) AS RES FROM PUB_SP_PROPERTIES';
           NewNumQuery.Open;
           if NewNumQuery.RecordCount>0
           then EdPropNum.Text:=IntToStr(NewNumQuery.FieldByName('Res').AsInteger+1);
           NewNumQuery.Free;
       end;
       if  IsView
       then begin
           EdPropTitle.ReadOnly:=true;
           cbPropType.Enabled:=false;
            ConfirmButton.Visible:=false;
       end;

end;

procedure TfrmEditProp.ConfirmButtonClick(Sender: TObject);
begin
if CheckInputData
then begin
         if IsEdit
         then UpdateData
         else InsertData;
         Modalresult:=mryes;
end;
end;

procedure TfrmEditProp.CanselButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmEditProp.CheckInputData: Boolean;
var ResChecking:Boolean;
begin
    ResChecking:=true;
    if (EdPropTitle.Text='') and ResChecking
        then begin
             EdPropTitle.SetFocus;
             ResChecking:=false;
             BaseTypes.agMessageDlg(BU_ErrorCaption,BU_TitleError,mtError,[mbOK]);
        end;
    if (EdPropNum.Text='') and ResChecking
    then begin
         EdPropNum.SetFocus;
         ResChecking:=false;
         BaseTypes.agMessageDlg(BU_ErrorCaption,BU_KodError,mtError,[mbOK]);
    end;

    if (cbPropType.ItemIndex=-1) and ResChecking
        then begin
             cbPropType.SetFocus;
             ResChecking:=false;
             BaseTypes.agMessageDlg(BU_ErrorCaption,BU_TitleError,mtError,[mbOK]);
        end;

    if (GroupValue.KeyValue=NULL) and ResChecking
        then begin
             GroupValue.SetFocus;
             ResChecking:=false;
             BaseTypes.agMessageDlg(BU_ErrorCaption,BU_TitleError,mtError,[mbOK]);
        end;

    CheckInputData:=ResChecking;
end;

procedure TfrmEditProp.InsertData;
var Proc:TpFibStoredProc;
begin
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=TfrmMainOper(self.Owner).WorkDatabase;
            Proc.Transaction:=TfrmMainOper(self.Owner).WriteTransaction;
            proc.StoredProcName:='PUB_SP_PROPERTIES_INSERT';
            TfrmMainOper(self.Owner).WriteTransaction.StartTransaction;
            try
                  proc.Prepare;
                  proc.ParamByName('P_PROP_TITLE').value      :=EdPropTitle.Text;
                  proc.ParamByName('P_PROP_N_PP').Value       :=StrToInt(EdPropNum.Text);
                  proc.ParamByName('P_TYPE_OBJECT').Value     :=cbPropType.ItemIndex;
                  proc.ParamByName('P_ID_SP_PROP_GROUP').Value:=GroupValue.KeyValue;
                  proc.ExecProc;
                  TfrmMainOper(self.Owner).WorkItem:=proc.ParamByName('P_ID_PROP').AsInteger;
            except on E:Exception do
                  begin
                     agShowMessage(E.Message);
                  end;
            end;
            TfrmMainOper(self.Owner).WriteTransaction.Commit;
            Proc.Free;
end;

procedure TfrmEditProp.UpdateData;
var Proc:TpFibStoredProc;
begin
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=TfrmMainOper(self.Owner).WorkDatabase;
            Proc.Transaction:=TfrmMainOper(self.Owner).WriteTransaction;
            proc.StoredProcName:='PUB_SP_PROPERTIES_UPDATE';
            TfrmMainOper(self.Owner).WriteTransaction.StartTransaction;
            try
                  proc.Prepare;
                  proc.ParamByName('P_ID_PROP').value:=TfrmMainOper(self.Owner).PropDataSet.FieldByName('ID_PROP').AsInteger;
                  proc.ParamByName('P_PROP_TITLE').value:=EdPropTitle.Text;
                  proc.ParamByName('P_PROP_N_PP').Value:=StrToInt(EdPropNum.Text);
                  proc.ParamByName('P_TYPE_OBJECT').Value:=cbPropType.ItemIndex;
                  proc.ParamByName('P_ID_SP_PROP_GROUP').Value:=GroupValue.KeyValue;
                  proc.ExecProc;
            except on E:Exception do
                  begin
                     BaseTypes.agMessageDlg(BU_ErrorCaption,E.Message,mtError,[mbOK]);
                     TfrmMainOper(self.Owner).WriteTransaction.Rollback;
                  end;
            end;
            TfrmMainOper(self.Owner).WriteTransaction.Commit;
            Proc.Free;
end;

procedure TfrmEditProp.EdPropNumKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TfrmEditProp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     PropGroupFIBDataSet.Close;
end;


end.
