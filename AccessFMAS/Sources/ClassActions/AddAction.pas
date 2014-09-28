unit AddAction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ClassActions, MainDM, IBDatabase, Db, IBCustomDataSet,
  IBStoredProc;

type
  TFormAddAction = class(TForm)
    EditName: TEdit;
    EditFullName: TEdit;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    LabelAdd: TLabel;
    LabelFullName: TLabel;
    IBStoredProcIns: TIBStoredProc;
    IBTransaction: TIBTransaction;
    IBStoredProcUpd: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
    FMode: Integer;
  public
    { Public declarations }
    ResultID: Integer;
    constructor Create(Owner: TComponent; Mode: Integer);
  end;

implementation

{$R *.DFM}

constructor TFormAddAction.Create(Owner: TComponent; Mode: Integer);
begin
     inherited Create(Owner);
     FMode := Mode;
end;

procedure TFormAddAction.FormCreate(Sender: TObject);
begin
     ResultID := -1;
     case FMode of
          fmEdit: begin
                       ButtonOk.Caption := 'Применить';
                  end;
          fmView: begin
                       ButtonOk.Caption := 'ОК';
                       ButtonCancel.Caption := 'Выход';
                       EditName.Enabled := false;
                       EditFullName.Enabled := false;
                  end;
     end;
     if (FMode = fmEdit) or (FMode = fmView) then
     begin
          EditName.Text := TFormClassAction(Owner).IBQueryActions.FieldByName('name_action').AsString;
          EditFullName.Text := TFormClassAction(Owner).IBQueryActions.FieldByName('full_name_action').AsString;
     end;
end;

procedure TFormAddAction.ButtonOkClick(Sender: TObject);
var
   IBStoredProcAction: TIBStoredProc;
begin
     case FMode of
          fmAdd : IBStoredProcAction := IBStoredProcIns;
          fmEdit: begin
                       IBStoredProcAction := IBStoredProcUpd;
                       IBStoredProcAction.ParamByName('PID_ACTION').Value :=
                         TFormClassAction(Owner).IBQueryActions.FieldByName('ID_ACTION').Value;
                  end;
     end;

     IBStoredProcAction.ParamByName('PNAME_ACTION').Value := Trim(EditName.Text);
     IBStoredProcAction.ParamByName('PFULL_NAME_ACTION').Value := Trim(EditFullName.Text);
     try
        IBTransaction.StartTransaction;
        IBStoredProcAction.ExecProc;
     except
           on exc: Exception do
           begin
                MessageBox(Handle,
                  PChar('Ошибка! Невозможно выполнить хранимую процедуру ! '+exc.Message),
                  PChar('Ошибка'),MB_OK+MB_ICONERROR);
                IBTransaction.Rollback;
                ModalResult := mrCancel; Exit;
           end;
     end;
     IBTransaction.Commit;
     if FMode = fmAdd then
        ResultID := IBStoredProcIns.ParamByName('PID_ACTION').AsInteger;
     ModalResult := mrOk;
end;

procedure TFormAddAction.ButtonCancelClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

end.
