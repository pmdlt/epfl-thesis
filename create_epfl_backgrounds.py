#!/usr/bin/env python3
"""
Script to create EPFL-themed backgrounds for LaTeX thesis template
"""

import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.patches import Rectangle
import numpy as np

# EPFL brand colors
epfl_red = '#FF0000'
epfl_gray = '#373A36'
epfl_light_gray = '#E5E5E5'
white = '#FFFFFF'

# A4 dimensions in inches (for 300 DPI)
a4_width = 8.27
a4_height = 11.69


def create_cover_background():
    """Create EPFL cover background with red gradient"""
    fig, ax = plt.subplots(figsize=(a4_width, a4_height))

    # Create gradient background
    gradient = np.linspace(0, 1, 256).reshape(1, -1)
    gradient = np.vstack((gradient, gradient))

    # Create red gradient from dark red to bright red
    colors = [(0.6, 0, 0), (1, 0, 0)]  # Dark red to bright red
    from matplotlib.colors import LinearSegmentedColormap
    cmap = LinearSegmentedColormap.from_list('epfl_red', colors)

    ax.imshow(gradient, aspect='auto', cmap=cmap,
              extent=[0, a4_width, 0, a4_height])

    # Add subtle geometric elements
    # Add diagonal lines for texture
    for i in range(0, int(a4_width * 10), 3):
        x = i * 0.1
        ax.plot([x, x + 2], [0, a4_height],
                color=white, alpha=0.05, linewidth=0.5)

    ax.set_xlim(0, a4_width)
    ax.set_ylim(0, a4_height)
    ax.axis('off')

    plt.tight_layout(pad=0)
    plt.savefig('/workspaces/epfl-thesis/Figures/Theme/EPFL-Cover-BG.pdf',
                dpi=300, bbox_inches='tight', pad_inches=0)
    plt.close()


def create_front_page_background():
    """Create EPFL front page background - clean white with subtle elements"""
    fig, ax = plt.subplots(figsize=(a4_width, a4_height))

    # White background
    ax.add_patch(Rectangle((0, 0), a4_width, a4_height, facecolor=white))

    # Add subtle red accent elements
    # Top red stripe
    ax.add_patch(Rectangle((0, a4_height - 0.2), a4_width,
                 0.2, facecolor=epfl_red, alpha=0.8))

    # Bottom red accent
    ax.add_patch(Rectangle((0, 0), a4_width, 0.1,
                 facecolor=epfl_red, alpha=0.6))

    # Subtle geometric pattern in light gray
    for i in range(0, int(a4_width * 2)):
        x = i * 0.5
        ax.plot([x, x + 0.1], [a4_height * 0.2, a4_height * 0.8],
                color=epfl_light_gray, alpha=0.3, linewidth=0.5)

    ax.set_xlim(0, a4_width)
    ax.set_ylim(0, a4_height)
    ax.axis('off')

    plt.tight_layout(pad=0)
    plt.savefig('/workspaces/epfl-thesis/Figures/Theme/EPFL-Front-Page-BG.pdf',
                dpi=300, bbox_inches='tight', pad_inches=0)
    plt.close()


def create_back_page_background():
    """Create EPFL back page background"""
    fig, ax = plt.subplots(figsize=(a4_width, a4_height))

    # Light gray background
    ax.add_patch(Rectangle((0, 0), a4_width,
                 a4_height, facecolor=epfl_light_gray))

    # Red accent at bottom
    ax.add_patch(Rectangle((0, 0), a4_width, 0.3,
                 facecolor=epfl_red, alpha=0.9))

    ax.set_xlim(0, a4_width)
    ax.set_ylim(0, a4_height)
    ax.axis('off')

    plt.tight_layout(pad=0)
    plt.savefig('/workspaces/epfl-thesis/Figures/Theme/EPFL-Back-Page-BG.pdf',
                dpi=300, bbox_inches='tight', pad_inches=0)
    plt.close()


if __name__ == "__main__":
    print("Creating EPFL-themed backgrounds...")
    create_cover_background()
    print("✓ Created EPFL cover background")
    create_front_page_background()
    print("✓ Created EPFL front page background")
    create_back_page_background()
    print("✓ Created EPFL back page background")
    print("All EPFL backgrounds created successfully!")
