using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KanColle_Remind {
    public partial class Form1 : Form {
        public Form1(string[] args) {
            InitializeComponent();
            this.Visible = false;
            this.ShowInTaskbar = false;
            this.Hide();
            if(args.Length>0)
                notifyIcon1.BalloonTipTitle = args[0];
            if(args.Length > 1)
                notifyIcon1.BalloonTipText = args[1];
            notifyIcon1.ShowBalloonTip(3000);
            if(args.Length > 2)
                SoundPlaye(args[2]);
            else {
                Thread.Sleep(3000);
                System.Environment.Exit(System.Environment.ExitCode);
            }
        }

        private void SoundPlaye(string path) {
            WMPLib.WindowsMediaPlayer wplayer = new WMPLib.WindowsMediaPlayer();
            wplayer.PlayStateChange += new WMPLib._WMPOCXEvents_PlayStateChangeEventHandler(wplayer_PlayStateChange);//設定播放監聽處理
            wplayer.URL = path;//指定音樂路徑
            wplayer.uiMode = "invisible";//設定為不顯示播放畫面
            wplayer.controls.play();//播放開始
        }

        private void wplayer_PlayStateChange(int NewState) {
            this.Visible = false;//將視窗顯示設定為不顯示
            if(NewState == (int)WMPLib.WMPPlayState.wmppsMediaEnded) {//如果NewState等於播放結束
                System.Environment.Exit(System.Environment.ExitCode);
            }
        }

        private void Form1_Load(object sender, EventArgs e) {
        }

        private void notifyIcon1_MouseDoubleClick(object sender, MouseEventArgs e) {

        }
    }
}
