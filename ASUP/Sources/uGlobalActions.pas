unit uGlobalActions;

interface

uses
    SysUtils, Classes, ActnList, Forms;

type
    TGlobalActions = class(TDataModule)
        Actions: TActionList;
        TableSigners: TAction;
        procedure TableSignersExecute(Sender: TObject);
        procedure DataModuleCreate(Sender: TObject);
    private
    { Private declarations }
    public
        FormStyle: TFormStyle;
    end;

var
    GlobalActions: TGlobalActions;

implementation

{$R *.dfm}

uses uTableSigners, uTableStrings, PersonalCommon;

procedure TGlobalActions.TableSignersExecute(Sender: TObject);
var
    sprav: TTableSigners;
begin
    sprav := TTableSigners.Create;

    sprav.Input.Append;
    sprav.SetShowStyle(FormStyle);
    sprav.Input['DBHandle'] := Integer(Database.Handle);
    sprav.Input.Post;

    sprav.Show;

    if FormStyle <> fsMDIChild then sprav.Free;
end;

procedure TGlobalActions.DataModuleCreate(Sender: TObject);
begin
    FormStyle := fsMDIChild;

    TableSigners.Caption := tbl_TableSignersCaption;
    TableSigners.Hint := tbl_TableSignersCaption;
end;

end.
