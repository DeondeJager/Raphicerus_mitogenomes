# Coverage plots for Cape and Sharpe's grysbok mitogenomes - Revision1
# Deon de Jager

## Load packages
library(ggpubr)
library(ggplot2)
library(scales)

## Set working directory
setwd("C:/Users/username/Documents/MSCAFellowship2021/Manuscripts/Raphicerus_MitogenomeAnnouncement/Revision1/Coverage")

## Load data (generated with samtools depth -a file.bam > file.coverage)
Cape <- read.csv("RmM001_NovoplastyAssembledReads_GeneiousMapped_Coverage.csv", header = T)
Sharpes <- read.csv("RsM001_NovoplastyAssembledReads_GeneiousMapped_Coverage.csv", header = T)

## Plot
### Cape
ticksCape<-seq(0,15000,1000)
ticksCape<-append(ticksCape, 16384)
p1<-ggplot(Cape, aes(Position, Coverage)) +
  geom_line() +
  theme_bw(base_size = 18) +
  ggtitle("Raphicerus melanotis") +
  labs(x="Position (bp)", y="Depth-of-coverage (X)") +
  theme(plot.title = element_text(face = "italic")) +
  scale_x_continuous(labels = comma, breaks = ticksCape,
                     guide = guide_axis(angle = 45)) +
  scale_y_continuous(limits = c(0,4500), labels = comma)
p1

### Sharpe's
ticksSharpes<-seq(0,15000,1000)
ticksSharpes<-append(ticksSharpes, 16392)
p2<-ggplot(Sharpes, aes(Position, Coverage)) +
  geom_line() +
  theme_bw(base_size = 18) +
  ggtitle("Raphicerus sharpei") +
  labs(x="Position (bp)", y="Depth-of-coverage (X)") +
  theme(plot.title = element_text(face = "italic")) +
  scale_x_continuous(labels = comma, breaks = ticksSharpes,
                     guide = guide_axis(angle = 45)) +
  scale_y_continuous(limits = c(0,240))
p2

## Plot together
p_joined <- ggarrange(p1, p2,
          ncol = 1, nrow = 2)
# Save as PDF and play around to get correct size
ggsave("Coverage_plots_Geneious.pdf", width = 280, height = 200, units = "mm")
# Save as svg, then open in InkScape and add the caption.
ggsave("Coverage_plots_Geneious.svg", width = 280, height = 190, units = "mm")

# Save as jpeg with correct dpi (ggsave does not give correct dpi)
# This approach gives the expected 300dpi image
#jpeg("Coverage_plots1.jpg", width = 13.1, height = 11.1, units = "in", res = 300)
#p_joined
#dev.off()
