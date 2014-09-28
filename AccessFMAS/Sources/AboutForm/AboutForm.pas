unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MainDM, Placemnt;

type
  TFormAbout = class(TForm)
    ButtonOk: TButton;
    MemoInfo: TMemo;
    FormStorage1: TFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
     MemoInfo.Lines.Add('НАЗВА: ' + scSystemName);
     MemoInfo.Lines.Add('----------------------------------------------------');
     MemoInfo.Lines.Add('Організація розробник: ' + scDevOrganization + #13#10);
     MemoInfo.Lines.Add('Розробники: ' + scDeveloper + #13#10);
     MemoInfo.Lines.Add('Дата початку проекту: ' + scStartDate + #13#10);
     MemoInfo.Lines.Add('----------------------------------------------------');
     MemoInfo.Lines.Add('База даних: ' + DMMain.KruAccessDB.DatabaseName + #13#10);
     MemoInfo.Lines.Add('Користувач: '+ DMMain.KruAccessDB.Params.Values['user_name']);
end;

procedure TFormAbout.ButtonOkClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TFormAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//     Action := caFree;
end;

procedure TFormAbout.Button1Click(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

end.
